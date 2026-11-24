Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556463;
	b=rlYj8frQ9uj8SIEBpWjhE8vql5kM8OsfQEVVd1KJLuENcOJc2Aqh1t4oRNu+J91b210G
	 jweeeOvsRgUN6/oSOZL1T1Fk5i5EJFkZqJ0ppW5E/+dzAPWU/kLLnPyp1Cgp4QM2fiyRg
	 AIniY1RTML8pltqrq3uD6h2r8lshDQgmJ4rM76f04XpQuagujg49xvxvx/oXiNDzul8xW
	 W77qpYp9N9jqjNa9/6Fwmueci1GTl+QgD8baTA9vFvQW7lAmmtQXYxEiTXn3TggRz0cDC
	 Wd64OVT1Edenpl02YtX/uaeBLN0FrcSuPDEWNdjePWLQ+pWmx8AhSlnwURjGUhlbQuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556463;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
	b=vKyqVekEAe9TNWmTXB6aJNrBk2k9UvDIU6aMcJLDkdB5r+KEG06lFNBqmTDV0cScsv68
	 /e578hP9jN6O9mLF1dYw8uy+xk44z1l0AgnZ6fQ75iTP2K7JoRNOwQrLwPTDKi1ivAF7q
	 4ZrbjnWxAEbOFidZ7TWTKSwHw9DgJ7t29/tybBx0ImczFrty4QuXxvI+2SDgqkgIxACLw
	 Exc8bSaVkAc5B7bEdhZCDu9B6c4h/egDY+uBccNU89O+YY4rOb3XORVenNkeUoaurKLLI
	 FdNDYV44sHv7PgDgUKN4fyvi9sZmYedOHkZS9k+DryZ2w7w2yeWesWeej/xm3NKvjeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbh6Go9Q;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052D0606A326
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:41:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 052D0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vbh6Go9Q
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-49a357e48a2so372877f8f.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:41:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795556461; x=1796161261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=Vbh6Go9QrB6H0Ci+ICfsnVc/Vnpu7Z5MeztCGu0guAbvGlNHsrrPkk0VY3N1pD7MHC
         VheORaOhmiPJ6e5quiRTYcJm5iS7zGq+1Sbb37Ae74UDo75P8sxw/QyBrrTAoVpkFRym
         4sN0CqvmxdOnDEXqASm05sl0L5co+sBDSlRInJOxlAXsoKtWpDLmJ/DhPMlt4FqWJDqI
         Go6Y81x/DV6JJexZsaXT39ZqhZ4lFAlfA9BUdf4N/IwO7ncpQGwUBclACpDn6fhpL4A9
         icVhYxkXAUfD+s36UfHnwhkknLYY5slL/VA5KajX5FgwI0lPvYUFloKHo3eDGQK8vG+8
         E8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556461; x=1796161261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6/Eo4P9Q5rSLruD9XOambCG6ddcXLpv660iZmjCXc5Y=;
        b=pUIizzTQXqGLwaTLHVl61El/YIfHO/tet+xn73DZAzxFD/XoL3G7u2syY9Ph1Ilk++
         REVJ7DA99lwEZA91DGcCzvecbvRwOGy758yO1Y7fWRwBUb0jZPNm3zWuF0BlSU4d8fSF
         6GJ3No4uyWyqDTuCN7OeXNDH4FGbcrgr+62SrrQ7JZfswBxB5D1aLNUR3VVXBmh5Acjd
         VsDdCuM4OO2IoT6UVtpXvK5X9Ny5PEgKy6sp91kp7xNPK4/MrSdcJ710FfixihdnfBpJ
         n0xsGpQMJCUQG8VMlSbXblM3rAEkvrFb/x5jUY+fmlqnyOt/6PkwNXI+4c5IlcVeQGsC
         ng4A==
X-Forwarded-Encrypted: i=1; AL+hErEiCbPYrmwrVKof3P+X7nk471tFHQdI12z6EIJLbwLoZxKEt+ApKO6P3zbQsgD8qdYfTPDIqls=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ykcJcWYStLwpKnHRqDVHsxXk5O3ZwIk9xhI1+CLltxJBV5yrF
	vOZoHVBKWYJJsOk2TVzXnMjWzgRQFwyZlXYF+GpvXftZZz+KnIuMldqL
X-Gm-Gg: AZFdTZcVDwLWix2lJVVu5LSkYiW5NGHYKrTpoOwwM4lT3hAKzraHRzjf1OmJpX2bLKw
	zcATD6ByQDTG5yEwRANPiyn1LF5qHM/+UCrBTLV5cMRhrm0naQWsf9BME2a2U7EF7R2n5kgRWDe
	oJFBwJHFkXpBUAvjvYPMU71g+2CdrStR3rrMlHIN07PqbHnag3lAZP88rLH8fiq1q8AHrCDyjuh
	LVEazXLEFnhyaMIPcd1JRO8IlCLNlBqINQO09lj6g4rvRTIYH2dZEIU9oKHeKSRsUs3C/XCaW5Y
	YuKt0g+u14urtNPpWRzequIo0UAL/VLtEjb3JXuxxFPwZ8QzFo9/YnDw0dIYxcZWLH2xlm8Cf1A
	S1B4Haw+R0WYvxzaG/AVPbx7Z9uE+DaC/83gEakFcUjial6Yl8iAY57CzAYOWtTEbZvMVNOEOVp
	43SR2SZXcS+WAkam25sHB1+V8vHG6rdeFl3iM1fPuA/tWm40RpjBboxOcscUV1hRSEpyQuSjziB
	PfLmBAkfZfaIhXI4Q1UQFxyIshtcE+eC7FzRg1Yv5m03bkvdk1EXIpKFQMI/cp3mh3+/GUmWn0/
	ID3Y6UI7FqZ1Q27OgLAV4tmzrMTjBU0o9ueCt1oz+g8h/vX4t4pCIM0qvaAFnnht3107gQ==
X-Received: by 2002:a5d:5888:0:b0:4a6:d298:832b with SMTP id ffacd0b85a97d-4abb6095e39mr30672204f8f.6.1795556461284;
        Tue, 24 Nov 2026 13:41:01 -0800 (PST)
Received: from Nuel20.localdomain ([105.118.4.83])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b5f6sm28290872f8f.34.2026.11.24.13.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:41:00 -0800 (PST)
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
Subject: [PATCH net-next v7 2/2] selftests: net: veth: propagate check failures to exit status
Date: Tue, 24 Nov 2026 22:40:25 +0100
Message-ID: <20261124214025.11603-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124214025.11603-1-emmaonana18@gmail.com>
References: <20261124214025.11603-1-emmaonana18@gmail.com>
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

