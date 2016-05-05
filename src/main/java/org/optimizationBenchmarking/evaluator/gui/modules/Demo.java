package org.optimizationBenchmarking.evaluator.gui.modules;

import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;

import org.optimizationBenchmarking.documentation.examples.Example;
import org.optimizationBenchmarking.documentation.examples.ExampleDownloadTool;
import org.optimizationBenchmarking.documentation.examples.ExampleJobBuilderBase;
import org.optimizationBenchmarking.documentation.examples.ExampleListTool;
import org.optimizationBenchmarking.evaluator.Evaluator;
import org.optimizationBenchmarking.evaluator.gui.controller.Controller;
import org.optimizationBenchmarking.evaluator.gui.controller.Handle;
import org.optimizationBenchmarking.evaluator.gui.controller.Result;
import org.optimizationBenchmarking.utils.collections.lists.ArrayListView;
import org.optimizationBenchmarking.utils.error.ErrorUtils;

/** The demo class */
public final class Demo {

  /** the forbidden constructor */
  private Demo() {
    ErrorUtils.doNotCall();
  }

  /**
   * install a demo into the current path
   *
   * @param currentPath
   *          the current path
   * @param handle
   *          the handle
   * @param demo
   *          the demo
   */
  public static final void install(final String currentPath,
      final String demo, final Handle handle) {
    final Controller controller;
    final Path root;
    Path path;

    if (currentPath == null) {
      handle.failure("Current path cannot be null."); //$NON-NLS-1$
      return;
    }
    if (demo == null) {
      handle.failure("Demo ID cannot be null."); //$NON-NLS-1$
      return;
    }

    controller = handle.getController();
    root = controller.getRootDir();
    try {
      path = root.resolve(Paths.get(currentPath));
    } catch (final Throwable error) {
      handle.log(Level.WARNING, ("Problem when dealing with path '" //$NON-NLS-1$
          + currentPath + '\'' + '.'), error);
      path = null;
    }
    if ((path == null) || (!(controller.getCurrentDir().equals(path)))) {
      path = controller.cdAbsolute(handle, currentPath);
    }
    if (path == null) {
      // ok, path was useless and did not work, error logged by cdAbsolute
      return;
    }

    try {
      path = Demo.__call(ExampleDownloadTool.getInstance().use()//
          .setDestinationPath(path)//
          .setExampleId(demo), handle);
    } catch (final Throwable error) {
      handle.failure("Failed during installation of example '" //$NON-NLS-1$
          + demo + //
          "'. Please make sure you have a working internet connection.", //$NON-NLS-1$
          error);
    }

    if (path == null) {
      handle.warning("Nothing was downloaded for example '" //$NON-NLS-1$
          + demo + //
          "'. Maybe your software version is not supported for this example."); //$NON-NLS-1$
      return;
    }

    if (!(path.equals(controller.getCurrentDir()))) {
      controller.cdAbsolute(handle, root.relativize(path).toString());
    }
  }

  /**
   * call an example job base
   *
   * @param builder
   *          the builder
   * @param handle
   *          the handle
   * @return the result
   * @throws Exception
   *           if something goes wrong
   */
  private static final <R, T extends ExampleJobBuilderBase<R, ?, ?>> R __call(
      final T builder, final Handle handle) throws Exception {
    return builder.setLogger(handle)//
        .setSuccessLevel(Result.SUCCESS)//
        .setFailureLevel(Result.FAILURE)//
        .setVersion(Evaluator.getInstance().getProjectVersion()).create()
        .call();
  }

  /**
   * Obtain the examples for the current version of our system.
   *
   * @param handle
   *          the handle
   * @return the examples
   */
  public static final ArrayListView<Example> getExamples(
      final Handle handle) {
    ArrayListView<Example> list;

    list = null;
    try {
      list = Demo.__call(ExampleListTool.getInstance().use(), handle);
    } catch (final Throwable error) {
      handle.failure(//
          "Failed to download the example list. Maybe there is a problem with the internet connection.", //$NON-NLS-1$
          error);
      return null;
    }

    if ((list == null) || (list.isEmpty())) {
      handle.warning(//
          "No examples found, maybe your software version is not supported."); //$NON-NLS-1$
      return null;
    }
    return list;
  }
}
