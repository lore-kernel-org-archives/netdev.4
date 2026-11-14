Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794673891;
	b=WdK5TGEJTyl8uc4ubg3HCgd75+LXxzzGlK1o8hDw/zF0oZnKfKkiBDrorkUBguCcNZja
	 cn9EEhBLGccM0ockWp9I/HVkM1WNaNgkUNmpjMMEovWo7/fEKuPX0VGTd+Gh3l5gpNOOm
	 5/RHY6b2IIR5U3D/MoEFW4N94CBQfAWCDKu/zrQK5ClJPFlg0RTrumAvyrLD96+57L8PX
	 rEbeGhuJ/fmrFoKO2CE22Vk6F4PqJJXMawqFGJ9gKw084X4u692xpPpEcL8gR/Z2p7t6R
	 KWHx9uHyOf6PNd/cQ4pNX+Zhc7kXtZI9HkZl9XcMGJ2qudethrn4Ezi7HcTszyrAKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794673891;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e8dTlmXnxqFuG7+5XnXvXTiqmqgsn0rg4gSRINi9weY=;
	b=qOvmLC+NXfIL0lNrXvzUeSTmOV+lMkF4ngO6xZGQlOdt75lqYizt4oiVtl/sqCslH6D2
	 J9I3tyxFFscg/qgbxxP+a+v7TqFlDcOwjxkEM3sr0SR3g8QyFX/Xd1Mc0tYB2lo+3q2Ib
	 GdcSMq7C6wKbgLFgISkd8uQ95XGYkRoBorpxfkhBq/cnFJ+3TLuW6LBfc96sz+XSUu8kB
	 Y8SAIMIWGFbBWyl8/1Qr82EaI8k4cgQ9yz0rJf5JGkLLkUZ1PjRZJPQphwG7bOfLx7re0
	 DI5E2r51A2ARlu9RyXPbChk4thlGUtYG14wtlD0V4TT7KJtfsVSHgcV+fMOgvD3tXUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xv8dAoIq;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C942606A329
	for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 16:31:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C942606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xv8dAoIq
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so1013962f8f.3
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 08:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673889; x=1795278689; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e8dTlmXnxqFuG7+5XnXvXTiqmqgsn0rg4gSRINi9weY=;
        b=xv8dAoIqJM+WMgYNEbWohtk2WvvWf6xcL8KwFxTycDvU6dCf8J+l6J7pUdw+kGxf0/
         F7/TvbL5tcs8WAg7l/fr8uLAk0088fc9hRhSAWPZ/e9NRx7izIu7AVZmBWyuWg3JkEgQ
         zO7kDbCgouQ3md8N+xoogWc1tgfDPhDxkzn84yHHRvlYz+LFKoT0S1dVqzK8i1Yi7efW
         Deo+zezanEta8BmQiSoz/MLov/AsSeRH68QwpI5RTZDp78ejGsltbQ+QMwSiTSq9CGN8
         QXfv4mQBLichr7ay7dZgVxJ6CX6X3KZpFf51uyP5M68YqqfXSqxJyieqRJB6rmDCxye5
         bnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673889; x=1795278689;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e8dTlmXnxqFuG7+5XnXvXTiqmqgsn0rg4gSRINi9weY=;
        b=TBvbn7z2XcPwPqgXJOjsnuBu5cyFQRWYMYqa+LA4kEwlZLjR/1/fBZ5YSi8uxIvfhS
         XEOkaCPLnvaFAwImrVT4k8eyLWaDoUiyYZS9k2kDsHIbFh0XxUmjatcqWEx8OxPILLdq
         2U10RDeXtEUS3ZHskjJ2f1Po0RiRm97wAMFN65pMUV63jY8IAHaHGydTMw5RY+moWMHi
         gTqoE0wgEBY5mWZpefGZlyiNN/dcfAa02Ins50sDs5ve2azJ4xylyYCYwE97cyeHqvFw
         0KxbywPi6UeDHjYiFc3sbD10nlm8gpjc0LZq5yeYzD9UObV5WEYOl5ubo2Gh1EZND4cn
         R7Gw==
X-Forwarded-Encrypted: i=1; AL+hErHoT03cTpVZJjCJArvDeqG5BRwWwoZY7RRYbmK/UcoKlYWtnau9SBJBfTjnioG1dPXQP6EdX9g=@vger.kernel.org
X-Gm-Message-State: APuU4Z8uP89lFqfChdqkRmmrjtpz3y0oVsx0vdznXVVG9Iac531h6pyg
	J+gteTNd/gh+jTQHvB5VKJHKeIPKjy15LOjLvQ6VlGFGDd3IDA0esUMR
X-Gm-Gg: AYBFou2kkiXcJyOiNRf25Mn8ORsB7kEZFeLH+yu7VWLPt1lYCEZ/l/7057OAdOidcGI
	5WIee6d40UGn/DLRXQww60IE6P2Tro4mwlo6oJJhIRC7C4d9HLKnfz6bmnTJOtHXobcx7PiPOii
	bmOFZeN6QR5sfba9V2SDmijB4ylpxJIMHmq1uAgo0UBI84GT+6CMuYz0wr6JRE2fCSEcy5XSvps
	mSzXlzRaIOto4ZuLGh73unWw0vgxa2hypBy8GQzEDZwQ+5wyC9AQR5Oox4LU1A+6H/AK4pd3O3s
	laBj2yitvWUX0hVpnMkJTImV6lwtKIwS26GTaf1BDN4dIzJXs/PJYS2SXruFkCliy1HDyZFEEB+
	iuA5WYBBcoFC27h4yWQH5Knq3DpX35P5V/kxuIDEoKUoEv1Sbj1Os1ybPHzF0GL0VZe7ZDB9sRx
	z2EjVsjtiUtYZ/H+huKqkNGInIZhAbWhCfgjm9z9xTj1Qs2N0OiLAXIXZ/KqKdiTsvJXZOAptmG
	NC+ceBZIrGYeyMReQV/TANEwD+qLrl+Z0VsK1aAz6qTTxqrIju4EfFwqvpc5XcuwtAPQEVbOPYG
	hQMCgiO+WctWukb1QAT0k6vTlA==
X-Received: by 2002:adf:e00e:0:20b0:486:f907:ebec with SMTP id ffacd0b85a97d-49c73ce4f45mr10000926f8f.31.1794673889109;
        Sat, 14 Nov 2026 08:31:29 -0800 (PST)
Received: from metepc ([46.197.185.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm11633347f8f.49.2026.11.14.08.31.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:31:28 -0800 (PST)
From: =?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
To: Jon Maloy <jmaloy@redhat.com>,
	Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Hoang Huu Le <hoang.h.le@dektech.com.au>,
	netdev@vger.kernel.org,
	tipc-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?=C3=96mer=20Mete=20Kaya?= <omermetekaya0@gmail.com>
Subject: [PATCH net] tipc: fix rc_dests counter corruption on reinit
Date: Sat, 14 Nov 2026 19:29:49 +0300
Message-ID: <20261114163113.208769-1-omermetekaya0@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

tipc_named_reinit() unconditionally resets rc_dests to zero while
re-initializing local publications. However, node-up events may
already have incremented rc_dests for peers without
TIPC_NAMED_BCAST capability before network finalization.

The reset discards these counts. When such peers later disconnect,
tipc_publ_notify() decrements the already-zero u32 counter, wrapping
it to UINT32_MAX and permanently forcing replicast distribution.

Remove the unnecessary rc_dests reset from tipc_named_reinit(),
which only updates local publication addresses and has no reason to
touch the remote peer counter.

Discovered by Sashiko, not triggered, not runtime tested.

Fixes: cad2929dc432 ("tipc: update a binding service via broadcast")
Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
---
 net/tipc/name_distr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/tipc/name_distr.c b/net/tipc/name_distr.c
index ba4f4906e13b..1dfe8475a75d 100644
--- a/net/tipc/name_distr.c
+++ b/net/tipc/name_distr.c
@@ -415,6 +415,5 @@ void tipc_named_reinit(struct net *net)
 		p->sk.node = self;
 	list_for_each_entry_rcu(p, &nt->cluster_scope, binding_node)
 		p->sk.node = self;
-	nt->rc_dests = 0;
 	spin_unlock_bh(&tn->nametbl_lock);
 }
--
2.56.0

