Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795285681;
	b=eDvJkQPPxFd4eIFElDM9K/X6vyWLPfqxPBemAyUhqefuGad3AuW8WaKoHiUN72YhsP2U
	 QPKxQtjjMSnwaT4Xwelr2rAHCIN0LW5S91rpQ8j4rqJlZfZaayBrrtdwG6ALUVEWK3xJX
	 OxoaOG3xg/XLQHhgnXoqy+nHy4Bcs3BLKBHXBKhFDB7fZgzYrttxYDO1fwTEIyKRDaI01
	 tIXZ9VgFOoqUW/3lc32dT2SfTjbV6AbQU/BlxZgI4UkJLMcvo4j5y6+A/UJHAX0keYx1H
	 mHe4a4fEkyALsfGEqRjHbo9d54THNiwGK4x5BU7Fsb7C22bfAvcwK0NfC2TXvs9OJ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795285681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
	b=kHcCNpOrk05T0qa27DCenlg+M7Cp6tAjAnDqlAk/4JEekkjAUnuJIVr82CTbMFv/Ng9s
	 /C0eKFDYR3bmyZKfyK8C0M/rCC2fgOCa75bkHpqW7gZdnjJatvqVnzRKG5DZ0RvuppWjL
	 aCcvhisKC9gebEBPSrokvB2tofmwGVu2IMQb1chso4TMhv9qWKbC9xCRaRueHZLZr3oBd
	 be9Xed5rjSn+fdzhHkRSqyhGLb5kEtaMnl/m81Pe5Q1gm0TgpH5nrCoM/9huhGHxkIaWb
	 VL6+YjWb14yIalrJK/HxVlmXtmb6/UrSiaHywUc6wR2i/x7CVkVEiEQzNFMaIgrPsAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyMluaa0;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACF1606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 18:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AACF1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nyMluaa0
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb7679f28bso1701345e9.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 10:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795285679; x=1795890479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
        b=nyMluaa0J1C8Evy34JB1U2I9D51Q8jV2XWGP33Q29wwR04CdaApUHFGVZ2CgDIlzru
         6JtGhIgueKLnH8bgq4caltjkpVzFJlDPCnKVJp3MR6DXGXe933oVBlSg2XJKdhtgD9y6
         8ZDnyTSpLzDB15hwFqy2tPgVOVY2zXmdMPG2Nv6qlJih+3q+3wcN4Ny6qm1QUQvl2C3F
         hg+NKn/4Zn4b0mhLm8VFpPrvJvhoGR/IL1PBlQUZZR83ssKIcynL9HPYhajsYO9E+qlZ
         s+EL0mbWGwNTx3uSimOvIAEK0oLNMwvjW+ejd7sUdYqOrb9LpWhoA1aBBJidKPmRS7Ak
         ILsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795285679; x=1795890479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Og6NCy+0q6Ms7/gjrdBqKnQWMZOjV+DT8n7b5GCP2c=;
        b=a1t0wh0KPYnTgok5AtRADEwoiywAwIfOlJxO37ikA11dlVmiqnekXJNcTo8ZT4uICN
         8210v/kl1eENXWGUvX0kPQb35eXynb2ZIUv++SKFrxKIDqbrrE7AxWpIEju/mR398p37
         BswZ7JKlx7FnFEcEGufjutrfAc4/zh9OyEifmY3ePcQStSUPeQfh8OKM+8kws0FiC0+A
         xmCoaC0u8bkm35aAl8omqNcZVZxCiN6ETG41vvYiAj9ZnbFW+jlkJisLYFNL4EniFyQu
         hgasInedsWNRNWbqIVPgWBRsBOB4JxckHIHwmuTX2MXqwVNlSIKw1LUMSU4z9p9EjA2I
         A3yA==
X-Forwarded-Encrypted: i=1; AL+hErHacA3H2lANmaC/kPKASGLKbNi1CkL+rlFZAa63c9zWj/SlCJXgjACxWJlWW6jDLL9FIx2Gthc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9t05aj8GTRyOA2Q0RnxS1aqNjlH3c0L0FLtCEabGqzWP1rUKh
	n/RcVmrOCJmle6uvgJ2GBHFnPpk6iACKxleXiHI9gCm80zxpRzi0KR8n
X-Gm-Gg: AZFdTZcDIsuO87uNXbSeeLZbQraATcn2OVtEZNoMmuPNG3Wb/680xnSzfGDiPQTLBGK
	sX6g+V4Pb7OeDoJtKVg/TzQCCW0+MstTm181ThNikcmNlVunl9H84ruK0JE6fFQW2URlFS/Wvl6
	oyR/rTlcaCTRI8skKpr4F0g3sLyGbm1z/QPTtVBMxpejmMekpCN66iDG0MecS+2jD0Ni69juG92
	grj/Ey8RrNEw8K670ctAr4xG7O3M7sfGDnSI1NBGts6hmnLi9guHsprgpOgM/2tm1bd3xw5iO5u
	A6ij3RkySBznXc9GquDG0Gat+A2gkz9yWLODr8y11U82+XaVK/Gq9Fj06P1GW+DFff9AII9iadP
	m08Nv9dZGRqMev5+MYamTxCSJyh8pQLS7mxScQyEAizMPGIHrda5c6E+oXkTmMWJUN5w/CCRQv0
	ZjqkQfkN0jefJ21FZlQSYCkRYPCsh+76GG+lGFSzSCL24yIiXiDphobZu/JF4vKdkIAzUW8bSy2
	jlKOFBsCqi5R/JVcN+Q5nW/mZsZhi3hSa6Ylez4iXk6ZAepBVmX0D9U3hB45AJDebI2QdkkrrCG
	n4OEqoEy6Fkh2R+KHXuGdKuADGUgUsnHDYfXaG1nAg848CTUZdDOVmQUfGpMqBdeZGwPEg==
X-Received: by 2002:a5d:5f93:0:b0:48e:6675:3a77 with SMTP id ffacd0b85a97d-4abb400ac51mr13733609f8f.3.1795285679025;
        Sat, 21 Nov 2026 10:27:59 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.129])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe75sm14215507f8f.24.2026.11.21.10.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 10:27:58 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	skhan@linuxfoundation.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net-next v5 3/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Sat, 21 Nov 2026 19:22:17 +0100
Message-ID: <20261121182217.4609-4-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121182217.4609-1-emmaonana18@gmail.com>
References: <20261121182217.4609-1-emmaonana18@gmail.com>
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

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 7a2bbed0263e7..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -474,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 tx 2 2>/dev/null
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 1 tx 2 2>/dev/null
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
-	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
-		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
+		section xdp 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -484,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
-	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	CUR_RX=2
 	CUR_TX=2
 fi
 
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
-	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+	if ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null; then
+		echo "fail - set operation successful ?!?"
+		ret=1
+	else
+		echo " ok "
+	fi
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

