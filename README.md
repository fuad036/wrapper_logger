<h3>The idea behind this demo project:</h3>
<ul>
<li>We need to log pretty often for debugging purpose. So, for logging we can use third party library as logging is not our business requirement here. But also, we don’t want make our codebase tightly coupled with that third party logging library. And in Future we may want to change that third party library with another library. So, we need to work in a way that we can change it with minimal effort. This demo project will help us to do find that kind of mechanism.  </li>
<li>Sometimes we want to log in console with particular log level. Such as error, warning, info, verbose etc. This demo project will give this kind of flexibility to select the log level.</li>
<li>We can have different kind of flavors in our project. So, we will able to make our logger behave the way we want based of different kinds of environments. </li>
<li>This demo project will show us a way to log whether in console or file or in remote location. </li>
</ul>
<b>The whole purpose of this demo project is based on finding one of the ways so that we can write maintainable code in production level application.</b>
