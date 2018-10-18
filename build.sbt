name := "add-taxes-acceptance-tests"

version := "0.1.0"

scalaVersion := "2.11.11"

credentials += Credentials(Path.userHome / ".sbt" / ".credentials")

val hmrcRepoHost = java.lang.System.getProperty("hmrc.repo.host", "https://nexus-preview.tax.service.gov.uk")

scalacOptions ++= Seq("-unchecked", "-deprecation", "-feature")

resolvers ++= Seq(
  "hmrc-snapshots" at hmrcRepoHost + "/content/repositories/hmrc-snapshots",
  "hmrc-releases" at hmrcRepoHost + "/content/repositories/hmrc-releases",
  "typesafe-releases" at hmrcRepoHost + "/content/repositories/typesafe-releases",
  "Typesafe repository" at "http://repo.typesafe.com/typesafe/releases/",
  "Sonatype OSS Snapshots" at "https://oss.sonatype.org/content/repositories/snapshots",
  Resolver.bintrayRepo("hmrc", "releases"))

libraryDependencies ++= Seq(
  "uk.gov.hmrc"                %% "zap-automation"           % "1.1.0",
  "org.seleniumhq.selenium"     %  "selenium-support"        % "3.9.1",
  "org.seleniumhq.selenium"     % "selenium-java"            % "3.6.0",
  "com.typesafe.play"          %%  "play-json"               % "2.5.12",
  "org.scalatest"              %%  "scalatest"               % "3.0.5"   % "test",
  "org.pegdown"                 % "pegdown"                  % "1.6.0"   % "test",
  "info.cukes"                 %% "cucumber-scala"           % "1.2.5"   % "test",
  "info.cukes"                  % "cucumber-junit"           % "1.2.5"   % "test",
  "info.cukes"                  % "cucumber-picocontainer"   % "1.2.5"   % "test",
  "junit"                       % "junit"                    % "4.12"    % "test",
  "com.novocode"                % "junit-interface"          % "0.11"    % "test",
  "ch.qos.logback"              % "logback-classic"          % "1.2.3",
  "com.typesafe.scala-logging" %% "scala-logging"            % "3.8.0"
  )

