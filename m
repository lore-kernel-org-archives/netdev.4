Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795490992;
	b=GxFOjFs6BWXgYjICFh03CyOIL6qGJ/PDsZCO00lbwTKe3qJXwYblCgiuP8fsgIIDZbG/
	 WtYqlJKnmIcIZEPH+ow6BkGnAxuLUUsDh5AQctqtghOJFy//AkFoUC1HyO56mlem5Rl0E
	 kFCcSvLAbFPBZJlTYwrWhr+3d72A4uiM4o+f64wp+rnQp+FCX5Yuww4L6n9j89cNukZZ0
	 08m4Wa+UPc/Us/9ZYxQE5KR5VztDpRG9YIK6A29q+RVaUrxy3hkFuPDSCIkWc2vP0lMw0
	 +Rdeh+6zhFpGFMLxVZmK3YSkRhNM9eo0dMXnkveDkpGlnNkFEI85MHx+8AjQCTQpTXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795490992;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 X-Relaying-Domain:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
	b=saRR1eIMitLY5EnLeA0KG0mElUF9gWD+djP2bFnmuKs2SfL/kNu2B6k7UIBIBIKZs3Q8
	 w9gnxVfu/Zdj+g/CzapyE1W0z4WOfNdDN82w4l/T9VbL+RtiIfREbrvPGaXJVE/0qHltH
	 Svd7VftAyRjn5971s1T8oJ7pLlG6nhMGAcF1TOvZhfAr56BJe5//Aq99uwC4+lnCmwWzA
	 kQyF6qFj9PwwqCn7FsbqLh/QKlqLA6ioDu1TSej5MwO3EwXBmXBOmKgPSiFF+NPDvKa6m
	 oTKfmhdDMcQvHPKtlTGhrOmfWfx3CIh5Ffp7yZXsiDI/lLeV7uFQo0jGf+iGL85YIhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andrii.net;
	spf=pass smtp.mailfrom=andrii.net;
	dkim=pass header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=cyVEFZrL;
	arc=none smtp.remote-ip=209.85.214.227
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D8F606A336
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 03:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9D8F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrii.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrii.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrii.net header.i=@andrii.net header.a=rsa-sha256 header.s=gmail-2025 header.b=cyVEFZrL
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2f046b0adc0so20443505ad.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 19:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=andrii.net; s=gmail-2025; t=1795490991; x=1796095791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
        b=cyVEFZrLqgJ70eSeLwYbJxeW1eLKC/b8ZFkHJAdgnDtJFTVOyziG9CfUFViuDFd1K5
         K19BbuIDmf+DQepi6NYJgahfL15NBziUZL/2Wm8WcNshMG2e3Eoio93BPosykeph6NMF
         1Q8CQn3L13ByWVExtc/46sEKeasUK1GHeZsfTPHGUTWWpKYcbL0t//rQurEsCv6Jvzfz
         A20Rvygg/F0n7QIF2c/CLIlnLpg7sePiLWdqqF96lTzJdxcTizbQgEuml9W2FRC5weuR
         KfXQ61n0Y5TT4rjCz3IiifOxSQF70MdBL1r3Hw2R8oVUZnY0roqF30ZO3mQtIPhd87o+
         c0Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795490991; x=1796095791;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5Opmlw6W+7IY9g9unaFxu16R4gE9zSxgAoE/RUOQJw=;
        b=q7RmZ1s06BMFVNO+NAK/r1j+F3hIvqIH7SzZzQJuNDqAPDB+FJ92LFRcnbC2yoet94
         JI0YORwZWKbNxb6QZexqvDxyb12cRCwlCKuV/7BufQhwXgfq3TRL+74GLFcWYFCiby/d
         sSd2hTmeHY+lgq4KVQACk6sIe37Q6fbQj07eUYrj15VdZVui/KJVC7JeU2rgbJ5YS8QH
         4VLlxNWbbngdDa9XsgHVOmK5MZllVOrctGvc1AOrKxIWw+om8F4hIphUF+8MuDlu0DZS
         tTV2k9dE/yskiepYZILxV9ZzUozMhVgJpBePxHq+YgxlMDfLyOfypwUZB7srSHOwaznL
         Effg==
X-Forwarded-Encrypted: i=1; AL+hErFFx56HbOCoNqB8uTU5MJqYmF2KuMTGtG4sm04xSWsP0DPL/VdgcCtS+sLBJK4nI/NnYrJEHjY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nghKGDMQVno/y7T2Hllrv1iC9pfg5fxMa0iqvGOibaRHo6hVT
	tFiFXFJ8in4BcbQKfJ2qnTqmBubljPSNBzBoU7tqltg6ZkFmStlBQPM63yOmmbvc6UGlfvgYpeo
	gha5BSJetV9D8XE4LhkxQhzty96TfZzWxfpEkNLC4t3kmlXBEWnQS
X-Gm-Gg: AZFdTZfz6iFxZz/r4gZ8T/mPC0stZJC1Msa+t8Xpd7OJ+oan52jnbGyuSFTg7PXGLfb
	8/OtHMNyI350wbhh60dgKETFwY4OiEHapFdkbb9QD83orwPb1TuT8wpNvm+J6pFdog01BgFMxpS
	NVhloj8iJ+Rhjf0XWTOoOHr1vp3eTaoZMAgGi5UWIaSzjDEnFQCT33rULSwbyofM9Fr23Hn0em9
	MxIkav+St4ocbddjQp9XCWiU5217BlHy9jxN0qtPlHeEfghq9sfW+U6ctk1N+WrwZb9A6v5Lqbv
	mggSe/6LEsVHnFjU13eaLRqfp3jAfz7OAAQlCHOxuZjUrMyAMD9b+lQHlnJ0l8jLv/J/w5XhvZ0
	njPUowQEpYHsOe+FC8UpXi5VQJCc=
X-Received: by 2002:a17:90b:17d1:b0:3a8:a98c:ea07 with SMTP id 98e67ed59e1d1-3b41c8e1735mr11583721a91.13.1795490991106;
        Mon, 23 Nov 2026 19:29:51 -0800 (PST)
Received: from andrii.ai (mac.hestia.andrii.net. [2602:f337:ed:4865:7374:6961:204d:6163])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41cfc74bcsm4445939a91.0.2026.11.23.19.29.50
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 19:29:51 -0800 (PST)
X-Relaying-Domain: andrii.net
From: Andrii Tereshchenko <opensource@andrii.net>
To: Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>
Cc: Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Dmitry Safonov <0x7f454c46@gmail.com>,
	Sabrina Dubroca <sd@queasysnail.net>,
	netdev@vger.kernel.org,
	ipsec@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH ipsec] xfrm/compat: pass on the translated length of a socket policy
Date: Mon, 23 Nov 2026 19:29:46 -0800
Message-ID: <5249741d-fa84-4d54-bf77-45f48dbbb169@mid.andrii.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

xfrm_user_policy() compiles a 32-bit task's translated socket policy
with the untranslated length, 4 bytes short, so the policy loses its
last template: an ESP-required socket policy then sends in clear
text. Have the translator return the translated length.

Made with an AI coding assistant, reviewed by the submitter.

Fixes: 96392ee5a13b ("xfrm/compat: Translate 32-bit user_policy from sockptr")
Cc: stable@vger.kernel.org
Signed-off-by: Andrii Tereshchenko <opensource@andrii.net>
---
The 64-bit struct xfrm_userpolicy_info has 4 bytes of tail padding
that the 32-bit one lacks (168 and 164 bytes on x86-64), and
xfrm_compile_policy() counts the templates as (len - sizeof(*p)) /
sizeof(*ut). With the 32-bit length one template counts as none, so a
32-bit program's ESP-required socket policy requires nothing: its
datagrams leave in clear text, with no SA and no acquire. For the same
reason a policy without templates, which IKE daemons set on their own
sockets, is refused.

The BUILD_BUG_ON()s check what the translator's memcpy()s rely on:
4 = sizeof(struct xfrm_userpolicy_info) -
sizeof(struct compat_xfrm_userpolicy_info), the fields before the
padding at the same offsets in both layouts, and templates that need
no 8-byte alignment.

Found with an AI coding assistant. It reproduces on an unmodified
kernel (ipsec master), without kernel changes or fault injection, and
no longer with this change. Tested with the reproducer, a selftest,
two boots each way, and with the xfrm_policy and xfrm_state
selftests. The reproducer is available on request; the selftest
follows once stable has the fix.

 include/net/xfrm.h     |  2 +-
 net/xfrm/xfrm_compat.c | 18 ++++++++++++++----
 net/xfrm/xfrm_state.c  |  2 +-
 3 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/include/net/xfrm.h b/include/net/xfrm.h
index 445223a8dc6f1..455b9f986ea5b 100644
--- a/include/net/xfrm.h
+++ b/include/net/xfrm.h
@@ -2331,7 +2331,7 @@ struct xfrm_translator {
 			struct netlink_ext_ack *extack);
 
 	/* Translate 32-bit user_policy from sockptr */
-	int (*xlate_user_policy_sockptr)(u8 **pdata32, int optlen);
+	int (*xlate_user_policy_sockptr)(u8 **pdata32, int *optlen);
 
 	struct module *owner;
 };
diff --git a/net/xfrm/xfrm_compat.c b/net/xfrm/xfrm_compat.c
index 670e3512fc090..af5cb36d691ea 100644
--- a/net/xfrm/xfrm_compat.c
+++ b/net/xfrm/xfrm_compat.c
@@ -642,16 +642,25 @@ static struct nlmsghdr *xfrm_user_rcv_msg_compat(const struct nlmsghdr *h32,
 	return h64;
 }
 
-static int xfrm_user_policy_compat(u8 **pdata32, int optlen)
+static int xfrm_user_policy_compat(u8 **pdata32, int *optlen)
 {
 	struct compat_xfrm_userpolicy_info *p = (void *)*pdata32;
 	u8 *src_templates, *dst_templates;
 	u8 *data64;
 
-	if (optlen < sizeof(*p))
+	/* The 64-bit layout only adds tail padding, and the templates
+	 * after it are the same in both layouts.
+	 */
+	BUILD_BUG_ON(sizeof(struct xfrm_userpolicy_info) -
+		     sizeof(struct compat_xfrm_userpolicy_info) != 4);
+	BUILD_BUG_ON(offsetof(struct xfrm_userpolicy_info, share) !=
+		     offsetof(struct compat_xfrm_userpolicy_info, share));
+	BUILD_BUG_ON(__alignof__(struct xfrm_user_tmpl) > 4);
+
+	if (*optlen < sizeof(*p))
 		return -EINVAL;
 
-	data64 = kmalloc_track_caller(optlen + 4, GFP_USER | __GFP_NOWARN);
+	data64 = kmalloc_track_caller(*optlen + 4, GFP_USER | __GFP_NOWARN);
 	if (!data64)
 		return -ENOMEM;
 
@@ -660,10 +669,11 @@ static int xfrm_user_policy_compat(u8 **pdata32, int optlen)
 
 	src_templates = *pdata32 + sizeof(*p);
 	dst_templates = data64 + sizeof(*p) + 4;
-	memcpy(dst_templates, src_templates, optlen - sizeof(*p));
+	memcpy(dst_templates, src_templates, *optlen - sizeof(*p));
 
 	kfree(*pdata32);
 	*pdata32 = data64;
+	*optlen += 4;
 	return 0;
 }
 
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index f4a4ddaeb9b37..eb984ed118884 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -3115,7 +3115,7 @@ int xfrm_user_policy(struct sock *sk, int optname, sockptr_t optval, int optlen)
 			return -EOPNOTSUPP;
 		}
 
-		err = xtr->xlate_user_policy_sockptr(&data, optlen);
+		err = xtr->xlate_user_policy_sockptr(&data, &optlen);
 		xfrm_put_translator(xtr);
 		if (err) {
 			kfree(data);

base-commit: b88c75488ecc768acadb14e980bbfa087b1dbf38
-- 
2.53.0

