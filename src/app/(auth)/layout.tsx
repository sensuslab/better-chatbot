import { getTranslations } from "next-intl/server";
import { FlipWords } from "ui/flip-words";

export default async function AuthLayout({
  children,
}: { children: React.ReactNode }) {
  const t = await getTranslations("Auth.Intro");
  return (
    <main className="relative w-full flex flex-col h-screen">
      <div className="flex-1">
        <div className="flex min-h-screen w-full">
          <div
            className="hidden lg:flex lg:w-1/2 border-r flex-col p-18 relative bg-cover bg-center bg-no-repeat"
            style={{ backgroundImage: "url('/obsidian-chat.png')" }}
          >
            {/* Optional overlay for better text readability */}
            <div className="absolute inset-0 bg-black/20" />

            <div className="flex-1" />
            <FlipWords
              words={[t("description")]}
              className="mb-4 text-white relative z-10 drop-shadow-lg"
            />
          </div>

          <div className="w-full lg:w-1/2 p-6">{children}</div>
        </div>
      </div>
    </main>
  );
}
