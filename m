Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795048233;
	b=xkkxzcyTCy4n+FNCEilpv0gARB31jNAicAkT6dxESZWlxgJTtObkLJvtNGFB7URDfkFK
	 91jSrQIUKkfGexc1VDvkGLRo8DR7k35xuymtBbH4I15QAzDsvEX+Mi5TwfTPa+3Yr8HvW
	 dFc6XfQt43ypEsRLPx8RsDHngXJCKiiIW7+KWTdNcmomuJfLRTxfZJWbPKLzHp0FsIQxt
	 FZchzkkDvbY6yrPmaqJ9stVEgvDxOSoELKm2FBDKJ0mV6lwTin0VnDeIQiHcMoCVtngP9
	 bIp77c64sF2MYqViCzR+JcirJHu4K4aFWkuvCOfsDNlfIEcTkRSnN0glTG905crraAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795048233;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tY6fRiRHZ4qZ5vYbTo0aHqI1fHONsrHB61AnWgkQo9U=;
	b=xnIVCmaNeJID3Clh1xms3IqXnO4wZu3vjn3fhrKwIGQcR0nBcdPxStz5Tw4Byc3XPd/H
	 4EnLM57iRIq8rs6mzQRy7cOwmeC87YDeQbnY8yuJDkM8Sw2KqNuvApXbMp7Nt9Ej/Sgf+
	 zeq9dyJuehnfJgIHgavJU00LNLUtpeaRS1q8Mswgd4eXNA1u946AMekRm7ZdgwYGusoKi
	 01081KE71lQ3LO0uqwmqOI2LWdRs7W9joz0cmn/xicpNbqIkg6jeoGHPIeUiINdmEYLJl
	 PlAOyU0PWKuBt68WGU7CEBjo5VoFcFv2sAY/3XWf7VK/Ai/vO9mwuwoTqvmMs3Z1rqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRNwZbbp;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AD460A260D
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AD460A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PRNwZbbp
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c50686daf9cso40445866b.0
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 16:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795048232; x=1795653032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6fRiRHZ4qZ5vYbTo0aHqI1fHONsrHB61AnWgkQo9U=;
        b=PRNwZbbpu1cxDps4lx1UK660t5mxgKF3mzzZubJ0SgZGhmNYtnHeBDIQK0hVqt6qs0
         1qzPOjOtvYhmWNnW1MrRjPaBgOicIxQW7ZaCLSAxktNNeZGws5e9jDQ3iQkqI/qxXto9
         JGct10nK5IE1P0lsAHlZ+iX24wYAY8s+K+d0jEBa9K0/R4A9MOJQFqH9ZIbj4GRy+rDJ
         rXohZgzARca5GUzOWkjtOE6N+z7JrIQjHoAbO2xd0JxxNhvMRK/LPYAZ7GfXvfkvJEt4
         +fhXNAS7vdhZlHrDvrbpkb2ndMD7fSl5EQx75kNhbXfrTx1SkXDKtXAii9K7l2iWP1C3
         E3Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795048232; x=1795653032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6fRiRHZ4qZ5vYbTo0aHqI1fHONsrHB61AnWgkQo9U=;
        b=T8RenA+udpzH6aa4XMD9J6v2oEJgw+SGxa0/z0CR3QpA1NvKU7vqr3QBP8uu8kvFzT
         7QeC3AD4eoBl/CWA2p6OBmoWibPsIWBN3xQ4D2zVBJjyh3G0Fm/Qj50b/cD/H09duab6
         gXwjpF2DOUsFBMsrZx5o+NOXn9l1CHBb+/3iPbeDEgfJOtisH/nk7mzhbsB+Th5VEDV4
         q/rSL45ie0lEL5z60BanVxKkPvsSzaCfaxMn+BuM8N1KTcgYrGFc6kGyvsc1n1m3xwrH
         YSvTV1VzXkaC/KZ03QVBdcWgTERqFMLEMQvsNO+Nx0+WOVmHM85JBwE0GKtI9I3fpnnf
         lJhw==
X-Forwarded-Encrypted: i=1; AL+hErFn1z0ug5/4Zhbu8U/dKOU/P6lO64i2pKB4HwPgoTfdQ3gch/Gj/ehQQG9dXWVcgpXOyOhDqkw=@vger.kernel.org
X-Gm-Message-State: APuU4Z86V7Hpc505eveta11epkuqBJqz1VY5a25F407JoWBXF50Gze9h
	UZwCTY04uWcZHu3tq+PBy37eBhou0Nn6JXgSwUDTL4AtBUnuNq7UcvX5
X-Gm-Gg: AYBFou3JW7nv26bPu4yJmiNJvmkM9yqJ3d7OsuUtK8JM7s/TlgaTO+eC29YmPfe0Hq8
	q4EDVQpAJx/uOos1fH9VtqrSK01bA/yYvELYee4elpRg/m8dWMYS4TEMTDM3qpq5n8dgK+cBj+X
	5f7W0ZQLPiWGxLHN4BmZ0hVKDVFWzIXlNess13O76svoEo4xIvXhAbksbRNLWn2dCsJRMTckLKm
	1CgS/nv8PoFdNPDNOOGAfBTl+7lKK7iAF549AUM0GV4VPZYtmal9MSFWGwBldRQ5xXEuFNi0D/k
	aBIX0XyiPfYdmwMgig4JMfOM3ZtExQa6u+0R8C3se0NqR5trcKlF4c0OCvz/5Rt3tvGGU/j3mN3
	lpohd15xpjusb65GA5sg5KHoAJHBHkmGHRW9rVl4KfM5XJMSb8JL4pWAjSaKPZkAmdvR4+ubya6
	FkyjLDQUD9tdutt/gBPt0wBQ+iSuBtDNoU4BDEBSxrF4RiMJzlnlyQ9vKP7ifnM8crQZdsbF69r
	4wsgkiG7M7zX4Qm9LWuyMNE2EQtqPItMam08+OFU/Pp6V1br5KJ/1urr0/F6hzSgGq1vXxgCZRB
	46oBvyM65GtKBAr7wumcziEosTlTrNT0Im9wrzoUjRmA8D8mVI4+fDqjnjINNTrOEpMR715pEw=
	=
X-Received: by 2002:a05:6402:ca02:b0:6b8:8146:a10f with SMTP id 4fb4d7f45d1cf-6b887e52710mr3301122a12.2.1795048231599;
        Wed, 18 Nov 2026 16:30:31 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.208.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b88a001123sm1729744a12.21.2026.11.18.16.30.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 16:30:31 -0800 (PST)
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
	Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Subject: [PATCH net v4 2/3] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Thu, 19 Nov 2026 01:30:01 +0100
Message-ID: <20261119003003.40482-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119003003.40482-1-emmaonana18@gmail.com>
References: <CAG4wq-d_30-B4wQZu48ZQXAORM4QxRqPfmYsmoHS0hiYp1EtTA@mail.gmail.com>
 <20261119003003.40482-1-emmaonana18@gmail.com>
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

Fixes: 1ec2230fc721 ("selftests: net: veth: add tests for set_channel")
Reported-by: Tianyi Gao <tianyi@cloudflare.com>
Link: https://lore.kernel.org/all/CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com/
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 26 +++++++++++++++++++-------
 1 file changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 5c1dbe1516bb4..2a37d21f97da5 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -472,9 +472,13 @@ if [ $CPUS -gt 1 ]; then
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
@@ -482,16 +486,24 @@ if [ $CPUS -gt 1 ]; then
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

