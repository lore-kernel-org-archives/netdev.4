Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795732907;
	b=dHIb05zQcIUaz4+hUJBxVa3/RSgKpLxU4gDRIFU3xoY8ttxw9y5JsBXDjDJ+Tmx9q/NY
	 IGdiX4iLPr4Y4Ko8kpKB+SoCbmghYs6RYIsj/x4lguIxlOWQL0G2xchMxPWUaEy3uLZVv
	 blBgXWoSnq8L2kS6K+a1yNNu/14lv40gsb5SGfj/1EQuCjtdQWzTcPjDHzKpm7NpK0tRj
	 w01M/CkZwoueudIAiOehS7CFoa/dEofIpxBXeB6nEhyrnYp+bkq6woq9lvIj+zTDayDQv
	 Qp4k/sPjuiEsR8PXA0BeiFgu8v78Zhe+L4B1eh49kJneVY2Rf8MrD6EKiUwjVRZ1p0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795732907;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wbe8qmGR7CaI/J85PN2eS5B1PjlxJ4Y+2/7Z8JgkW/g=;
	b=Q4P8Mw3GJm8VJP1gq+dJ5/WBdrjQgf/M7gzyPKKFvXv+JsXWMcTcv1U1ZlxfM8cSZ34v
	 OhU3cZYUXqBzHHz6Qbt4BqEw2iDOJkBg15rVXl48RdbMtE+unMyvrJFGLpzXPLzljFY9S
	 hybfDQQgp0dlPOL+M8Vi6MB9+tkRJzerQvQ417kHZHacYR+R/FoO8CVj4YmxNB26rxejC
	 frX+Q8BSxAHFCSWlHpG5cMozmlKH6OFWTMLSVz5NWuomDKyhp7tIxxS/c01JPT9ue6xWe
	 37YGK9f/8P3MkV92JuPGlbASgUaKXM5qRrNw5e2dfiFrqBaEi3vBNWEwdRD8yvS+60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=none smtp.mailfrom=stellman-greene.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JTmHMyAN;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 596FB606A321
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 22:41:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 596FB606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=JTmHMyAN
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-949664ee41cso752837085a.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 14:41:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795732905; x=1796337705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wbe8qmGR7CaI/J85PN2eS5B1PjlxJ4Y+2/7Z8JgkW/g=;
        b=JTmHMyANPlI9jW7h9rI9H34UhqZmDzBwiUOu3ycs11iWGQT5Md3RPZwFn3jd2IEljK
         pJaoJVDmM1mrzByZq4yh5tgWnA+gSt60TVXrSZqt24cXxNJB59HODarhyXLJ/fZg+LU+
         O1UPL8IvJdZRHR5utR7CSYsoljA3YV0gEtukIMFzw3EF7ZvJTvuQXN1XVDFwv239lag+
         ytxJroSa76NKZ3c99Z7jAvuxArkW//3Wl0O2IMn0LE6nZaKTDmTA5Xhm5A0n7jBnTObv
         JFdm3qmeHF+PwOOQIpt238IjurWkJnVVXlzvW0OFLC7ILeGwwmnHC3Wfpa3hRFCDLz9D
         C6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795732905; x=1796337705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wbe8qmGR7CaI/J85PN2eS5B1PjlxJ4Y+2/7Z8JgkW/g=;
        b=iZ13kVXETHMEC5d+bz/ki/ovDwjVX/l6r9tN+aO/yrHiLa68H5+aRSzDp+iiw3/yC1
         JQwAS9X5/GbiFW5SdB0Px3dVKCHapPHzy/tZVCSduTHamjQ3EFSDY5Cqqk7p/qtQ06Od
         xSpI4QJp7QFwB39OybS0DWHX6wPlYU2rQtCje84zfhnfQkIU7OZI7STIqBo9RLNfqd8Q
         mTVQM3xB8KJxNjYfNRa5hkRFxAYfWvODGjgBCptXFVQ6Z/7S5LxeH9L6O7rKAHOMKsSK
         Ws18aAWKESmLyUcyS4N9qTWuUpMQIOy42irpx0aJjaNsoTwnmnx8WzF2NvIrQi8ybyo5
         h/zQ==
X-Forwarded-Encrypted: i=1; AL+hErHJur9++22kvi3pOtHplftnB9tpbO1Rq0ydx6W3/gqqZ+E4nxAPastQrpFQXSHzeO5DCWbf3ro=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ArOpmpmbqirXV7yegyuuFFvvjcNg5Mzqs8ptlhPqlKFf6Kw2Q
	D6IPIkx3xOV8DOLbvgQbqStT/FPOwUuhn8mlVtRfo0XlKLZTecYwTeYQCtvE/WkjAM8=
X-Gm-Gg: AZFdTZdDG5XYSOiDfvMR3cECYiygAyicsDu+Dzmpz8kZJVHw0d2bFHMcR5vJeyER5lh
	NPOMVMXpv40OqhGexmfFBBd6y9+yQd743SlHnQUlyOUMEquGO9sbGMnZBudIUdboFi/QAgREEz5
	BWGVmUqp/72F/LAco5CWnsYDxUC9HIYUvyVUy1Rvnv7eIQpWUMghWmKujAzn9fokXBMr0lcLhQC
	O05FmxpEJRNpkwz7tUtScgEw8Ve/upclOHLi+2dt6S6ki4PX9pHnpUbVMqdbWRw41TNstD1tXrt
	jjngE207zhPE+D2o9C3yVgDFVI62lwLuuxYHweuYgrfLF9/yqjQLxE4dJneFPyoHdeTxydJQTs2
	3O3gR7KGmfj4eQhwrlZWjb7GBQP67yV4l2ICQ8h384r9+qU04LAcLf/WeBz6MRfquzOefi79ztw
	NgJb0OEEvJ5bWasadfBqpqvfnlonbkMWPbKlS1LKwbSpunYzcWeZhs1qVRrfgsgVePH1un86tzH
	7B5l4pwTbjQplcfrlIzWHNBt7uoGCjUd/J3FjiQPBBR8sdJ/ozKeLZYpmntndTSrtJ8pdv2Uo7L
	Svx1Yboncj0ZYg6JE6fTjW93gs+jGShf0CER17qJyiqGVKAAKv7TkXy2N/LfMoU=
X-Received: by 2002:a05:620a:2b9a:b0:949:6d95:f63a with SMTP id af79cd13be357-949bac834c8mr3664200485a.78.1795732905223;
        Thu, 26 Nov 2026 14:41:45 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a9a3:d406:9193:c9bb])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3bec3dsm1675981885a.23.2026.11.26.14.41.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 14:41:44 -0800 (PST)
From: Andrew Stellman <bugs@stellman-greene.com>
To: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] rxrpc: Reject unsecured calls to userspace services with a minimum level
Date: Thu, 26 Nov 2026 17:41:37 -0500
Message-ID: <20261126224137.55862-1-bugs@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
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

From: Andrew Stellman <astellman@stellman-greene.com>

rxrpc_get_incoming_security() doesn't check rx->min_sec_level, so a
userspace service socket that sets RXRPC_MIN_SECURITY_LEVEL above
RXRPC_SECURITY_PLAIN still accepts incoming calls with security index
RXRPC_SECURITY_NONE.

Refuse security index NONE in that case. Kernel sockets are skipped,
because kAFS and rxperf set RXRPC_SECURITY_ENCRYPT on the kernel sockets
they serve on. This changes behaviour for a userspace service that sets
the minimum and relies on unsecured incoming calls being accepted.

Tested in an arm64 QEMU guest built from mainline 9437ee8b6cf6, as uid
1000 with no capabilities: a service socket with the minimum set to
RXRPC_SECURITY_ENCRYPT received an unsecured call over loopback without
this patch, and with it didn't receive the call within four seconds. A
service with no minimum received the call in both cases.

The issue was found by Claude Fable 5.2 and Claude Opus 5.5 running
Quality Playbook, an LLM-driven code review tool:
https://github.com/andrewstellman/quality-playbook
The fix was drafted with OpenAI GPT-6 (Codex) and this changelog with
Claude Opus 5.5, and both were reviewed by me.

Signed-off-by: Andrew Stellman <astellman@stellman-greene.com>
---
This only covers security index NONE. I didn't test rxkad or rxgk, but
nothing in them reads rx->min_sec_level, so calls secured below the
minimum look like they would still be accepted. I can send a v2 that
enforces the minimum for those too, or a documentation patch if the
option is meant for client calls only.

A reproducer is available on request.

 net/rxrpc/security.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/net/rxrpc/security.c b/net/rxrpc/security.c
index 2bfbf2b2bb37a..52015c73c583c 100644
--- a/net/rxrpc/security.c
+++ b/net/rxrpc/security.c
@@ -138,6 +138,11 @@ const struct rxrpc_security *rxrpc_get_incoming_security(struct rxrpc_sock *rx,
 
 	_enter("");
 
+	if (sp->hdr.securityIndex == RXRPC_SECURITY_NONE &&
+	    rx->min_sec_level > RXRPC_SECURITY_PLAIN &&
+	    !rx->sk.sk_kern_sock)
+		return NULL;
+
 	sec = rxrpc_security_lookup(sp->hdr.securityIndex);
 	if (!sec) {
 		rxrpc_direct_conn_abort(skb, rxrpc_abort_unsupported_security,
