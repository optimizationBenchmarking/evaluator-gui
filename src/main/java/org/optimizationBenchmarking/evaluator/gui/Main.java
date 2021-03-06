package org.optimizationBenchmarking.evaluator.gui;

import java.awt.GraphicsEnvironment;
import java.awt.SplashScreen;
import java.util.logging.Level;

import org.optimizationBenchmarking.evaluator.gui.application.ApplicationInstance;
import org.optimizationBenchmarking.evaluator.gui.application.ApplicationTool;
import org.optimizationBenchmarking.utils.config.Configuration;
import org.optimizationBenchmarking.utils.error.ErrorUtils;
import org.optimizationBenchmarking.utils.error.RethrowMode;

/** The main class for the GUI. */
public final class Main {

  /**
   * The entry point for the gui.
   *
   * @param args
   *          the command line arguments
   * @throws Throwable
   *           if something goes wrong
   */
  public static final void main(final String[] args) throws Throwable {

    Configuration.setup(args);

    try (final ApplicationInstance instance = ApplicationTool.getInstance()
        .use().configure(Configuration.getRoot()).create()) {
      if (instance.hasBrowser()) {
        try {
          Thread.sleep(400);
        } catch (final Throwable ignorable) {
          ErrorUtils.logError(Configuration.getGlobalLogger(),
              Level.WARNING, "Error while waiting for browser to start.", //$NON-NLS-1$
              ignorable, false, RethrowMode.DONT_RETHROW);
        }
      }
      Main.__closeSplash();
      instance.waitFor();
    } finally {
      Main.__closeSplash();
    }
  }

  /** close the splash screen, if it is open */
  private static final void __closeSplash() {
    final SplashScreen screen;
    try {
      if (!(GraphicsEnvironment.isHeadless())) {
        screen = SplashScreen.getSplashScreen();
        if (screen != null) {
          screen.close();
        }
      }
    } catch (final Throwable ignorable) {
      ErrorUtils.logError(Configuration.getGlobalLogger(), Level.WARNING,
          "Error while closing splash screen.", //$NON-NLS-1$
          ignorable, false, RethrowMode.DONT_RETHROW);
    }
  }
}
