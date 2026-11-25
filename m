Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795634108;
	b=4pwKc+l90H1WHkDWjDAXHldUw8t0yGJT+M7VLP5I80o054lU+U8ir4nn+YjuW+6JjECN
	 M7PAQDcyIYv0JQAdIbkgaYSpUcE36Zu/Z9XHwKMb33XHX4tbRiGeYI3gM6eZuCHapkB2C
	 m7r+CPbUqHBEi68r0TNjXSd1cjjYpL0jhjkaegUNQQGxTmlQyocCICAUEK6ER8n3D0xHO
	 0ccfa24qDJusdZSExNIgdyzc+E/t864qCxqAghykXxh0ZVsGyVbONkQqnn+6XXpRR6ngB
	 rMX+SBwvcLywoooEPV2DoivXKYHTbe8+f9+88tjtbvcriiwrBOv43pUMHkWtkqi7U/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795634108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
	b=UaiO8zp58gakBTA5TU9D3DzM/YIRAjYx+c7/ywkYiRiF6U0XKevk8BPeb/OyQ31Okx/v
	 liaIPeMl42c5rcpLAetu6CLmG95+LpgRFoPDJTt0NRivADtavBDf8hddmlLvIUw31mmie
	 uQyT1lJ5XdMEWflS0jyjO3R574OdKiXjlkQ0c3hTxD9ksmW1qgpyxZRiNfTaghISlhvbs
	 XYUdgHA7qKHJZfWyIrdC81kShbawSstzIPDtqNYPm10n6jrCXP2bc+l1N33G2+xrQldKy
	 WGbfrk593A0Cblu/M1i/USIMZ2uGzmLxvDn2r/sCHD2jvfP62dzedKOISHrHwJXC+kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=blockcast.net;
	spf=pass smtp.mailfrom=blockcast.net;
	dkim=pass header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nEC4fdqe;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA30606A335
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 19:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1EA30606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=blockcast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=blockcast.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=blockcast.net header.i=@blockcast.net header.a=rsa-sha256 header.s=google header.b=nEC4fdqe
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f0426a65e0so39148305ad.3
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blockcast.net; s=google; t=1795634107; x=1796238907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
        b=nEC4fdqeLFuOx7pZ9gejzfft5pb20bd4XKtV7usvGd31fLlqVxuebaVdG/h4js03Jx
         fV8cM/XuasDvTzoIqa73NH/HbsT5AClRxqtCuZMbit0xqFlMP0WiFQEnp6rVIl9Y+bSd
         1aqjxSMfppqr6shrFEfjey6aC6bvF53GxCKDl7nz4K7Iyzv+SJ3Gdsg+p1F8n7Zx8G29
         /MY2nIUJKMzWPT4cfvwySr7oyBFqun+KRqB9OchapP6GKDm0FljKD3RtXNZYOx8h9wdq
         b8ChyynDuYMPSfp7sn8+CY89SXRzL+Yqs4tApEJw0DpqlAQpa0KkdJfvzz0gVHR1Qjpe
         tlRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795634107; x=1796238907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2XXDx1N+ETD9sRZ73sW75oA+drTEDlkdMhzQqYaN1Bc=;
        b=r63OoB/C0nDiHnJ9AFF5UK3ADQZqSy033sEDRgsXSKiulVZg18emKHLDUrIs+Cn1+q
         hOYawhFHUAbdpXvYy1tmfuNel3UHWXR5xAMq21/BKn0ebxhv7w8/Jfyhc0EEmFLvvTt5
         t00CO8/XyHRzkcvLATs6oakZVnz3skdH9wR4ubhX5z/+GHl1d/ziH8BG054Cn0LzBOs2
         NgPavY5w6VXrVIXc2BzSAeIxo9sGtv37rXyjAzwh9tqBOSJ3/7YmgxhSi0d6lZWxJ2ck
         tFXYayn45vc8Jdyi1fgPMmV4cGcWlmh9Y5zktZ7T7BPKkPRvIptQB530RQXRt2iyLoj9
         /Fdw==
X-Forwarded-Encrypted: i=1; AL+hErEWMRdlcNB2voOVI0nw7oBIhxp5uqNc0VFm1sRJGTWW1+b+SUg9nL1SNBWxelZZ/wwK0Lt5c5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z84vS4ga9MHVLO5gRja2e1cLPIcI5vUClGJc0MZT8SNcVR4eb+X
	w1KU7bOiFKFZSE5NI0VFmG9pVR7B5vHIwsXmZSbcYQ0hz7Ih3UYprThyHfaqlqeXecY=
X-Gm-Gg: AZFdTZetemWczrROOS0GnamxWIDAZBrDcc6ugQB0oPJmQ4oe50v3/9kVJqNUxeWjlrt
	78TSA/gXtrUcN5nqxJpY6/nqVVzcBpMkx5tw7CdCj7Jx8HKVV62QsEYVen2ucXogzBW7JVg99kn
	hCatORA5/QIYdtP9Lhu99EBnzQ4mMScDaqD5oaBtcWRDEEOmScpo28lw6nQsjG/3WMzNOO4wmKT
	cabUTd9WZC8k/67v+6GgxJrr/b9CuGxPneOWMqyjzGJPunTmQ09vA5n3ykdJh0s7foBe2piwwLi
	g5fDD0b3rGeYQkdUNYuPnwjwrd9TflVjsqtQlKqetcfY8/885umlC5/1fTQP6rgZkTCoihg+BjO
	lN2cgKoHtGm++JIJdF4ap/hwWQuTkViC5P1omw3vabFQPqFV9xp6QY9aXQLqo2+BKbh1I2jMRra
	edQFArHW/sDkMUJuArt+SIpZMdm/LcP48qVYFzrKdfQa8Q+jGZFCdq6wpazO/kpoBwO0Sbnvfar
	rreI2SIuHAp2VAOPj7t1lcC/gkZbfF/qnTwHoIw1MggN6zBPt0mTShkh08ZknHlyqP5Kt8ZIr3f
	HqdxwwHeatk2FJgQ+2BtDKSsTvOYvLLIJOli3bNVu4fa7uo9dgQ9utSKlh4LB/JJMTp88f685BK
	hVh4SUXSTY6LBXbldVA7TFH3alr1ogldBNqghIopoMhVwTpld0HE=
X-Received: by 2002:a17:902:e5c5:b0:2e8:4f3f:60dd with SMTP id d9443c01a7336-2f03f215a7amr145555155ad.37.1795634107510;
        Wed, 25 Nov 2026 11:15:07 -0800 (PST)
Received: from devbox.ts.blockcast.net ([69.25.95.32])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f105b66sm92413855ad.51.2026.11.25.11.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 11:15:06 -0800 (PST)
From: Omar Ramadan <omar@blockcast.net>
To: Taehee Yoo <ap420073@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Simon Horman <horms@kernel.org>,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2 10/12] MAINTAINERS: amt: cover the amt headers and selftests
Date: Wed, 25 Nov 2026 19:14:48 +0000
Message-ID: <20261125191450.2497936-11-omar@blockcast.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125191450.2497936-1-omar@blockcast.net>
References: <20261125191450.2497936-1-omar@blockcast.net>
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

The AMT entry lists only drivers/net/amt.c, so get_maintainer.pl does
not find the AMT maintainer for changes to include/net/amt.h,
include/uapi/linux/amt.h or tools/testing/selftests/net/amt.sh, and this
series touches the first two and adds selftests next to the third. Add
the two headers, and a glob that covers amt.sh and the new amt_*.sh
scripts.

Assisted-by: LLM
Signed-off-by: Omar Ramadan <omar@blockcast.net>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9f1a6024f..6a028cdba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1506,6 +1506,9 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git
 F:	drivers/net/amt.c
+F:	include/net/amt.h
+F:	include/uapi/linux/amt.h
+F:	tools/testing/selftests/net/amt*.sh
 
 ANALOG DEVICES INC AD3530R DRIVER
 M:	Kim Seer Paller <kimseer.paller@analog.com>
-- 
2.47.3

