Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795644996;
	b=WUX8k9+bz7aDomVfTMTp0gSoP0tYRUBMRDjQtBGBgTgU13UK6spiopkMHQgZ3Q+TFhOk
	 fFFBAgbyleGiK4xc9eYApJoPMHuT8WxVUIPNu20tS2PZ12EisB12y7I+8QLX3pFmHTORS
	 Q8U93ros9N5UdaPA3Ls5qQakP4EbwKSj6nnRL1D6OeIGZKA90mf0oGe5l07DaivhGhZqP
	 f6FJa45cV8ysDyjF05ClyzdkrKdfTeS5Wr6wBZGN7+1hyoOUINPxU+veG4T5azA9Dqlm2
	 7jBOJudUuJw/eX03Y/YoimAET/PbBb2BcwL5Zd8gjhSU/ukb8rsg0ZDmCn7bLDjIQ6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795644996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
	b=5UkBgUb5we+NmXNbT2/ddbFNqh1fcn9fqURwaBbhmFt3BzCNxqXo1mh0dVcOhmHwExsX
	 4a5Z2wBXKc0ojmoVdjFfv0DnWs8YOw42WdfjK5VRZCiPbZ4TaY8/JnmX1lrUNGwDXuzqv
	 UH6XPHKarDDyx7WRQ5VnTuHIGzhns4kPMWqfS1LQh+WBic/KBRYuVW+3PCzpG51g3pOwK
	 PuRRqghvpmjxo4mFtZZrygXfjXHgbhjNSAtdFJTYWSgs8eRjFzUbP1TSFNmVaiI0p6oG0
	 qrC6uDTNsPx5xb9uu0Da22FWavNjge9HyUWJF+KIrvIzxsYbtIsvXTzHD9FqB1C10XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--elkin.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Teo9NpwM;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1CE606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 22:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1CE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--elkin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Teo9NpwM
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3ae17c536so5972283c88.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795644995; x=1796249795; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
        b=Teo9NpwMC8++rq2N5VzSXEBY28G3IyCvEyTmeGoWzfeKOD38o/o53G3uCPTR54GSyy
         dinPYPYlmuh0l9ATRyWKbafkOXI7YwfDzWn07wLcEE/OkhI5oVPSATtPWGssnCkrTInA
         KGYYdVRONNUG4RCPdqaQz9cl18CIjw5fUIIuz4hMWsmxolBtobnk/TVBLgt6FvegUuFa
         bMBxO2rOlx0McaiitvROzCh1kPyYhSOuwP/YueXJxwFGeW+txPvEjpfM6Ocf8MIqDN4F
         /1aO9DBgh+THvP4Tj0+ISB+nOXDb8THATTrfiuqNVqy5t86CEOxOMyKYcpC9OYROisdY
         C+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795644995; x=1796249795;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iizZjgnpeBrU8oFjWBrGM7wL2DaScW85+h4ZhCRucEE=;
        b=AHa1usEmG5hVun27iW4+VPgUgiko7DdU/OleJQq3qhNi2nBQ0KF4qbyxBr2YMEvYTR
         jDRMb7WJtwEXJUORTETHLwptiH4gVynE8mNYM9cJ51TlWfqCgOJmNvEZV/Z1TfoGdTON
         kFHlM794UO/VQzIZG6Bu1gwGX1HB2Yxx1+sp5uI7Bn26CYTDuDihYiTa1CqaLI83muWz
         SxvirMG3dx3urnMcACMgVMU8BMqu/Ivgj1nW3veRhtu0IXwcGdjjJhpDUn2JmPyPzvkq
         TliJgikVX1xi5ZXnQqTMjGN3HziDf4Zaa4CI8zRf+X2B6yhhhPz3cHyDCsm/lbNoBz/+
         sinA==
X-Forwarded-Encrypted: i=1; AL+hErFNi9tagfIuAtRBKJfmGDAR0X/+dZvoXBOmLhrzrUWsbss57p0AjD+h9dQYMgalG+0yz0oBWxI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5bZV/ffkAzL2xN2HIWHe3NsNJu2ueAb9TQieHbwROMZ/t6Gix
	Bei8yqQZROqxqBGAId+VatHv38lqtWgm+3KO6icpCuyO6WouOtnqqZSqBKw0f7BWTeCWrUidRpg
	j7w==
X-Received: from dlbrl2.prod.google.com ([2002:a05:7022:f502:b0:19a:1425:bb9c])
 (user=elkin job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:3f07:b0:138:30b1:4c00
 with SMTP id a92af1059eb24-1b5567b5685mr21927000c88.3.1795644994359; Wed, 25
 Nov 2026 14:16:34 -0800 (PST)
Date: Wed, 25 Nov 2026 22:16:27 +0000
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125221627.1419412-1-elkin@google.com>
Subject: [PATCH net] phonet: fix use-after-free in can_respond()
From: Elkin Cruz <elkin@google.com>
To: Remi Denis-Courmont <courmisch@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Nathan Chancellor <nathan@kernel.org>
Cc: Simon Horman <horms@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org, 
	llvm@lists.linux.dev, 
	"=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?=" <remi@remlab.net>, linux-kernel@vger.kernel.org, irogers@google.com, 
	Elkin Cruz <elkin@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

In can_respond(), ph is cached before pskb_may_pull(skb, 5). When
ph->pn_res == PN_PREFIX and pskb_may_pull() reallocates skb->head,
the check `if (ph->pn_res == PN_COMMGR)` dereferences the dangling ph
pointer before the code re-acquires ph = pn_hdr(skb).

Check for PN_COMMGR before calling pskb_may_pull() to avoid accessing
the potentially invalidated header pointer.

This issue was found while trying out new Clang static analysis checks for
kernel bug classes. The finding was triaged and fixed, and this commit
description was drafted with the help of AI, then verified by code
inspection and compile-tested against linux-next (not reproduced and not
runtime-tested on hardware).

Fixes: c3a90c788b74 ("Phonet: do not reply to indication reset packets")
Cc: stable@vger.kernel.org
Signed-off-by: Elkin Cruz <elkin@google.com>
---
 net/phonet/af_phonet.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/phonet/af_phonet.c b/net/phonet/af_phonet.c
index d89225d6bfd3..e70ade97bf17 100644
--- a/net/phonet/af_phonet.c
+++ b/net/phonet/af_phonet.c
@@ -294,10 +294,10 @@ static inline int can_respond(struct sk_buff *skb)
 		return 0;
 
 	ph = pn_hdr(skb);
-	if (ph->pn_res == PN_PREFIX && !pskb_may_pull(skb, 5))
-		return 0;
 	if (ph->pn_res == PN_COMMGR) /* indications */
 		return 0;
+	if (ph->pn_res == PN_PREFIX && !pskb_may_pull(skb, 5))
+		return 0;
 
 	ph = pn_hdr(skb); /* re-acquires the pointer */
 	pm = pn_msg(skb);
-- 
2.56.1.839.g22a8290db9-goog

