import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("dev") {
            dimension = "flavor-type"
            applicationId = "com.example.dev"
            resValue(type = "string", name = "app_name", value = "dev App")
        }
        create("prod") {
            dimension = "flavor-type"
            applicationId = "com.example.prod"
            resValue(type = "string", name = "app_name", value = "prd App")
        }
    }
}