Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795504777;
	b=aEZ/k44aMsWUjVw80oNx7MiEHhV2rQgD3aVAQ+hhgBXHQiiPinnRvFFG+/m9njoT5hju
	 hSd5q1uugDafpS8MyEs+rPeaG59xOdx33qzheKiz6fyLK17VGezbThPud6Y0FA6SvLWAK
	 gobtv+t4VRVsqf9GdXfMPd1G4ZOVG4rsGGQladRHGrXAbgv8y514ecklwhZJr2QWwUhF1
	 1BdKCdeKZwCYB125tbOtoJnXDiQ+cRA5PJhjxnDJ0XUR5d1Ura1ktld5rDVqpzRDopLaK
	 s1bM/zkMlvl8X5TiAChZv5e56QsVOt2CE5kzLXU3+gECLTgIYP1yiQIewsWB5Jjf1fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795504777;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
	b=NGyOCknxmtmGPOQuFFH4MoqX1jtOc2hpyObzRt72wcmGkyn1cTw9Dv6NNP0AcQfFMDTC
	 2kcsyqQdJBGexY4SJHT6Oa2roQXuIDWzjeQTjP2HgA5ds1A+lNQ4VognUvzp8JmCXfDAQ
	 Ib95zjgmO3Qio9fz/OG26BDMkPxdDMM6a1SbWg6teNpVQJq9rMbT3hRXguI8WB3qX1a+c
	 DonvUVr6EdRw0PCwomeLOpfmHzqz+BRNDVchBL+BIYWgFlPoJ4/wFOfGXRGNUsYNJx+32
	 xBrR7MLTMndE3BDg84pA6wPtDHxICKb5QB9l5jPM/nYaNid8g+ceIdp09tpyDGZehDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb33G8mO;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9993606A681
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9993606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jb33G8mO
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1068448b3a.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 23:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795504776; x=1796109576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
        b=jb33G8mOS/Hi1jWlbaudR+Y8v/b7kjNRymBbnp45JRiKAkM+lr1QSILrSFem736iC2
         AfvHjuItnI3tl4xVMogeehGLzwOMrB2+yFoU13bZ3qGKTRZR9JaIU8msDmLWruizzj8j
         OSk6LEihZORe7s9OQMIZGBkXVm+kEF6KUqbfzlc4/pxTv404AitSpyj5YzzJEcHIsezr
         /1DLOdMmJ6e9rD9GDj/ELR4XWfVfJG6AjbqkDpEa26i/A1g0xYDL07lr38ai6F0IKdp5
         KKtU89PJzK9LVmwEICshchHb2kl73xBJ3h7Hg5CleDSX8DZLiDYtmfUHIYsFky5Lfs90
         2YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795504776; x=1796109576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=psyQ3R+IPgp+Vrzba+etQGrWT4agfKgZFhLKLz+GJT8=;
        b=CUBPcClEycEtSRqK4ImbdvdBKYLZghReUiBCJrOUkpqCqJ1pj2u+NB1nMUzsIMUYgq
         lgezqA5mLIHQSjh21tgDZM97xRzCO//IfHKpNy51n2BdMOgborIO1hDPhnE3Wlaa+SQG
         rWugafE0pjl6PIadd9X0Sa2spTeajJ32uB66SXqd57e4sFm0erJK3+02giL5MCteYHk8
         DrNfKZwHzIt9noVaEnW8NggthH+Ezp0HXM79jSZWmlk6vL4hT65TcQ0DJiZbwNTziKoL
         uxZY1UubWFmaF+4hb0j/sfMrtgGgfvEfJ6u37Btitk3mi0179JC05JAd6swdfI8XenwL
         h09w==
X-Forwarded-Encrypted: i=1; AL+hErEY6V+BGK6jGf4XQcHa/dX+a1tBWSMy99gbc7wPx2zwpDsPrPZHvcwvwOoDwnH8x4dL0FO3dKI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vdFgK452JuC4ThYUAXs6MmMEuIZDzPvBgEanArQsHCKx99RFX
	lKXoO4LP+eK6MNwAUdl1itQ0IFxECvZSEdzBN3hxZbx6XE7WGAk2AXxb
X-Gm-Gg: AZFdTZdCi6XA5Qdi2KK0zcpRF/NUh026TuSVQhMhBXiCJCLSSKRPnhGCrEfbIuN8OPi
	OH6V3rSrYNCztDPNHgEkqJ2vdYl9CaOeg77GST1SOs+oKCQzN4ObqapSn5TYw9SG5/6jiSyciPM
	44v12phAwPhpgtDpU0C+EyFM4Ih2U3/EOCslN8c1J3Off06suT11LlvnsGuQAFvjCCM96BA8hnQ
	eORnuGhxqKzFvrbdNgQlUAYItMMEb74hgUXWj6H1wmp9HQqotgPUvAWESYGdQ81RXbCOLxNb82e
	SzIK/yysLeD95Ts+H2XaNu879Ck1ea7IbvOjXFHdfnmc+GfaCfc6dnS68zjhnj5qRTLj7319pe9
	lcSL+ihdcsnUtxjFgm1c/N42kk0k+j+9zMnxP//umd4Zu9PUumbGsaGk2+V9S1PajM2CplMHnYF
	xIVZ32A9GXoX3FI6Gq7kYn7awPThe4wT+MvmEJN5GlaGDnRYm836SFU7qUVbXIzanIZpQ2VjR3B
	zCkbZQQy9eulmVbSdCCVVy2I5PX6HX2/vzk5PkAC65k9eNUH2j2uz2R2RYwScl6iVAZ568F37hm
	kb8zF6Ehvhfg19aIQlSIMfO8ISVjKqt3A3lGTgvCs6jVwFe2STDn1/kZ9O4QIS+SWwYN7TKb2dp
	0KmNnuvFxcruPa8wPiS0=
X-Received: by 2002:a05:6372:a748:b0:3e1:885f:b4ab with SMTP id adf61e73a8af0-4014a27e905mr10620093637.8.1795504776021;
        Mon, 23 Nov 2026 23:19:36 -0800 (PST)
Received: from LDYT9Q2G2M.pvgl.sap.corp ([2a09:bac5:cad3:119::1c:2e7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde7f91c6f5sm4425486a12.27.2026.11.23.23.19.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 23:19:35 -0800 (PST)
From: Zhiqi Zhang <zhiqizhangg@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zhiqi Zhang <zhiqizhangg@gmail.com>
Subject: [PATCH] selftests: netfilter: fix missing echo in nft_nat_zones.sh
Date: Tue, 24 Nov 2026 15:19:26 +0800
Message-ID: <20261124071926.8818-1-zhiqizhangg@gmail.com>
X-Mailer: git-send-email 2.54.0
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

The ping failure path tries to execute the failure message as a command
because the echo command is missing. This reports a confusing "command not
found" error and returns 127 from that command instead of printing the
intended diagnostic.

Add the missing echo so the ping failure is reported consistently with the
other failure paths in the script.

I found this bug manually. OpenAI Codex generated the one-line code
change. I wrote the reproducer/test case, reviewed the generated change,
and tested the patch.

Fixes: d6905f088d2b ("selftests: netfilter: nft_nat_zones.sh: shellcheck cleanups")
Signed-off-by: Zhiqi Zhang <zhiqizhangg@gmail.com>
---
 tools/testing/selftests/net/netfilter/nft_nat_zones.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
index d935c967dd..f15bfd3373 100755
--- a/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
+++ b/tools/testing/selftests/net/netfilter/nft_nat_zones.sh
@@ -171,7 +171,7 @@ done
 
 wait || ret=1
 
-[ "$ret" -ne 0 ] && "FAIL: Ping failure from $cl" 1>&2
+[ "$ret" -ne 0 ] && echo "FAIL: Ping failure from $cl" 1>&2
 
 for i in $(seq 1 "$maxclients"); do
    if ! ip netns exec "$gw" nft get element inet raw inicmp "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 }" | grep -q "{ 10.1.0.3 . \"veth$i\" . 10.3.0.99 counter packets 3 bytes 252 }"; then
-- 
2.54.0 (Apple Git-157)

