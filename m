Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795555058;
	b=I7ov0uukUm3830MbRIZnodokMRtdKqpkq5V2JTNmdMP6Y7jOVLwFAHEHww8WqiNdqPNA
	 P3ytIFZTSNdIC5QLkeqtqpTw7kU5hfHZSIdGGV0TM1J+9+hSL/AaH1xvhSNuPB5GL/cqQ
	 RrE8L9qTWemnOQ9WfYXVIN89wsNTBJo0qi3lQyOYedoeJHAMm3p7slva7bQ27e951JChY
	 +vRnzJhUGnAMzqAyocqxBdcP78iIYvXWFfJPmsB/GNESXE9+AuDEWDy1+M1DDLd8MpuGZ
	 7r352CIXQ97AzXHy4xpa6NbsrEtJ47Ecxn4s9Holn32FAVPAkr+53yFRcRpOZ1GYvxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795555058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
	b=vvycBFlDsXpLHqks0z1yH4O1LDpRwUHoE4hxtk2t/65yXeXE0F2Achi0z2hBUmP+yYL6
	 2sEtNgF8l+ctsJt/ivKBZhuA5tELN2X9tJQr0L1r2gkJ37E6QN9ApAcmY9H25ssA+fMmD
	 i+ZS4o7YJ/VHglWysrjkurt++Pi/Kav18rcLa+1z0+ZhD/Fa4uhM5DrOqJe+DyL+OE1GA
	 V9nZA1L3L9TpKRG1jnge943BtM5XIausRxF0bvXredhqJd6B3NPBEyWBl22ck3pZMHoTK
	 heQsjwDv2GlNwmjPFcZfeouXncOv2ozWnBbK/0TvvNcpViKo40unXPlbS1l+lOwb67w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2PIYrI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1A4606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E1A4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GL2PIYrI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so5438275e9.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795555055; x=1796159855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=GL2PIYrIRpaC5rEfwK58c4QXdqCa62VtMZeg/Gf53XM/8avpaP3BiMh3NxbbFalaNX
         6TPayS4v0zk2Z7E6zpWNN8y63hw+NozjuUfQJq3931vwVaoIfWgF5FbIxrcPBdwlmogt
         oW21UZVGoo6oWvk2rJgdK1Rhb/79yD+Ca5fp7caFv/ZyUSmxmh7p/1MOml30zBU6HIfi
         Mgu876CjesSi0Kc4c6jLwivGfmq5tdlW1X2SOsk9t1dXdEhiM+BQrmY/EqaVRq1RdWPb
         e3UlDe5zqGBoOwnFFh0Yuhbk8Ezl60AUhi79R+mQIG610LaBXv2pQAeBytJoq2OmkXmt
         NHYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795555055; x=1796159855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=PvjFp0I/zxf4cN4+/QUxzSwYijIgfIU4LVefohVLBtYGmVPxjcnDIFBsI+6komeK2I
         MNMeBlEqiAW2JW2bVETrDLIiDiFTwTIDtlCyZA9Kb1XWtOUnsMUehP8L8v4P7tz6Jw9i
         0SzeG9DAYFy5WlAM9RpE4esU3L5fLd9isFzO7IEfDz1Y7II5EBihVy+9V75xAingz5Y1
         EcmIR91g/emk7hrrWRyk6qNUVOuHkUC95RhSyS1wCeC9JBxCJvXmyorSarFzcCMOT10p
         BDPntl5gIvNRuEMQWA/a8Va5GVDRb40IeWt2Hp5EulnMWZaZkoEDmn7zMLDvkkY7Q2wc
         T7mw==
X-Forwarded-Encrypted: i=1; AL+hErFGaPjFCQOYhZrt6AXvza/wNLjBH3p1P1TENml9QTMOt+rJsAfywGKcPkr5uOauRfQHszLUlRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cpld/CzCiNlVmrErYGYB6dT1pxCRGK+MwImvOuYoHJP7rbG7W
	LtzzgRBcNIGISxxAhhYZrmPSzo109vHNwCy4E6DIy/tEhIUWIVciJ/J9
X-Gm-Gg: AZFdTZfg9COR/L5SDn0riW0Hnq+0b4nNf644qz4NWMAAilxPQGuQyvXgEgDI8/8m0JT
	sYNP03gpfTtT1lMYyS+0KVaQ9mJUq3acoHMu/k07stWfH5ACLj1Rcea4jAfgR38wdCO/W+z0WSX
	loHgMB3LbVU+MH0PpvqkxT9gcbhAmjjlKrS5zvkMmploZwHwCBAUgTjEQIxf+zkHkeN/IVDfggE
	9yOg2Yt8kXOtb4R2xHMTX1wFpGl+SPGwSOeajxPGJfXE3OfFRp5NIkgo9iJgrYkMVHF2+Vupy2Z
	3u8AhG9UNGN535MNlCb/qxPineQnHPbc/M1m3oz1cxDisUAyd2stUHWjQWptY6wz4DUNRsTplBv
	5ag8unmcyj/rKGzenjEuTE03uyRif0P4CUHKQkIIe/CNba6OzqpoNP2rgYUbRI4sX7myE0jNdjf
	CsibIla8wf3GQ/YGPrV/rbO8L0vNUJlM+j8kG017kDhH3uaeF0+UIFP8ijKNi5rBsVjtikYqe+u
	ix/JDEXlIQj9pdc5kXa2F9k1Ey16KF8cYWOueHGbyTe+RZZfmUg9xB4enOprqx+IeGzIURyWrLS
	j3BOItyVI0H+EBr9bD5M6Woe9I4ei1NPmMBhBzWLu54yDnPKmx7nEtuEUoyIkGGguvuR
X-Received: by 2002:a05:6000:4a15:b0:4a6:9f2f:4151 with SMTP id ffacd0b85a97d-4aba57e9972mr28188997f8f.0.1795555054760;
        Tue, 24 Nov 2026 13:17:34 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110c3csm29347713f8f.36.2026.11.24.13.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:17:34 -0800 (PST)
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
Subject: [PATCH net-next v6 2/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:16:45 +0100
Message-ID: <20261124211645.5751-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124211645.5751-1-emmaonana18@gmail.com>
References: <20261124211645.5751-1-emmaonana18@gmail.com>
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

chk_channels() reports mismatches with a "fail" line but never sets
ret, so the script exits 0 even when channel counts are wrong. Every
other check helper in the file (__chk_flag, chk_xdp_feature, chk_gro)
sets ret=1 on failure, and all chk_channels() call sites expect the
check to pass. Set ret=1 on mismatch.

Three more checks in veth.sh print "fail - set operation successful
?!?" without setting ret: "bad setting: XDP with RX nr less than TX",
"bad setting: reducing RX nr below peer TX with XDP set", and "bad
setting: increasing peer TX nr above RX with XDP set". A kernel that
wrongly accepts any of these invalid operations would be reported yet
the script would still exit 0. Wrap each fail branch so it sets ret=1.

Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Tested-by: Tianyi Gao <tianyi@cloudflare.com>
Reviewed-by: Tianyi Gao <tianyi@cloudflare.com>
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 27 ++++++++++++++++++++-------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 22246278e6049..6eeb123aaf885 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -130,6 +130,7 @@ chk_channels() {
 		echo " ok "
 	else
 		echo " fail rx:$rx:$cur_rx tx:$tx:$cur_tx combined:n/a:$cur_combined"
+		ret=1
 	fi
 }
 
@@ -473,9 +474,13 @@ if [ $CPUS -gt 1 ]; then
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
@@ -483,16 +488,24 @@ if [ $CPUS -gt 1 ]; then
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

