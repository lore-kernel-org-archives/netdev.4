Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794818525;
	b=tPkPiTEgqMz96h9EdDGd2YsRRUPXmt/OvjTO73vJMqhmIoLHfNyIPTxn4c4P+uGHxc6L
	 25Vu/nhqh875YUcI3YGxKlHg8Ao/z5I6dYevC7hvac97kRLw5sOI9w5cVq3ac1501jXNa
	 0BFmQ+FISjoIg/nlkfwXeJWgX6FqYNOmwRLb8kqNXd/F6t1h9JugF4MbieHgUqOAGuHRJ
	 K8vnB7DKJaehVDM89IIo0PZ+WU+RmYygsjHaiKYP+DYzYhxk2FhXmiejr7GtPNTWdY2mR
	 RDJWkGRjLCg2Z4cmdLadlioGkzwRZnLhirvKVGZCxj4jSa4PFxBRF4XEM0cuDMIBV+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794818525;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
	b=iTFMSMLqQyj/c2/AbWXyyrBxQ89hAe6Yi32NhWgG8ZyLXvy3/DIwRvLxvFYiXigqpnWk
	 ROxFaDu5L8HW3YrrvUNPuA+tGFwk2beasfgODx3ZY5Z3JYOjPxhhT9myPRP7GHDOZ5wpQ
	 m07qr8SqUqEqrkDf5+wa3e8Vxw31eqCiM/FJJLmFPckdFbRB8Qked4kbfqKQeCbiflDuT
	 qV11ZCrBxSD1lsQEHYBoyfF6ewkID6r3o6ZQCFYcbha3oUGQHk9fLZT9y6tpA2umC5n+y
	 IzdIOhAvhcZRAh8s1PEK084R8tch1h3qgY4tup8dfi26JkAQr0W5HWIw2n3GxUlBC+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoA9pBn2;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B60606A31C
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 08:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14B60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoA9pBn2
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a5348aaba5so3410975e9.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 00:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794818522; x=1795423322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
        b=ZoA9pBn2SaQcXdbdTbDGdUqkVqrFSWt+g1wynpHCOei8Q80uX3HN3uHnYFkli9EpRG
         32eCjf+w9PF111gI8CFo/2Fi6iAE8awhIK8ghCdj1w/Z5crBUJCEdB83o/LRmQazFxCj
         h5RvnVii23vtsdO+89HmwI8+MkPFeZOKVW9+kNYlK7TFWubhLKPo5wYsAhYf/4RCkI1T
         UoVlloGuVEBvVpV5t3vXpqc9paD7z+rZ0msoiFb0TefH5FcBOiGaSkEvImmecOZo97oE
         lJpXf2p7y7H1i7zqcUPmiYhnOp7/Ab9yXqGHGSu6bD6g4r8JAACBJYaBTBaZ/1hZOsdg
         BvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794818522; x=1795423322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IbDW2yfp/G8HBG/wT9ipOeQ5Z+TwPor4+SUJgaV0UTA=;
        b=oopCs5htKv+WBnBZDYs3DtlNfrS7gb6wNJ0GInYNXwxM7xo7r1RqzjQS2toqQf8rDC
         KThEJjlvli7r79FptkwSQU5XZPAmkO3CvCen51jYsRd+DLevoXdxukFMDNUYNrGulmZg
         gngK1qWTnnAmp8ZtZ6RVghGfAbgpWblp92E8j1FIUiuLGS+MX1VSlvwulo/SRX0QwwnR
         tW7nx6WW5U1i8XnW5W7XxFNy6H+GjN0pUUVZHmrqCRULzgTzkPHc82wuJnt4pmvGMdCL
         mwmUFcxmDQUejQQl2EYtuQf4bZdscaE2ZHP6q2+E7REsqbciDH7UDlrnym0dvm7fkUgW
         XiOg==
X-Gm-Message-State: APuU4Z9C5P/jCyHTq/mGVMfmbOav2t1UoFiQryoC4fZOjvoD6y8CqCgY
	TdqM35M0tV0UeeI+KCV5bCIr94k6EVUa0Pl+VCZM+9kU1HIZucYGUf3l
X-Gm-Gg: AYBFou1OpWIZpk2nHfIT7GjSNwYVfzI0ky4T6HJ3QgBwDyglKt4dZELqedZ0g510SWz
	hnBvRR68cx0Q2G4ej6HLVoWO5FWR07GWUcqA3O3SQL3h88iDriVLRsMlIKm23c6KEBt8sqX7Wbx
	6aIk/TFRa+ckmOxUJ/2cwVA6uXy9X1pFnoXHWi3GT7kna+6XynMIZHaz+aj2Mr23cDCwW+3y2Zb
	EnaLnVBUAlyU1F5T+VYcw8/+DhGNOZX5NKMY0mQ98cCpgy2JWh1vuYHBst+WBB/Dt5SlaQlaa2r
	eRqXMiAdDBhzAtk2VJc5AqUkHFC1RvtMP/GzRerzOoIbv24zXsncTBokERjVgwL6jTTII6QoMI+
	VFhTjcmy2+t7Akq03g1pBHG3i7DTize4zZxRaDn2lF9FjA4uCEggw+z4ihMv0fDVJVoDr1sORAt
	7jCTBv0jJp+DkYF19KjCS2uNl/ckchciOVXFs9T+Yz5CZtVE0/o/yVW3OvG5t0rrhhec7Wedx1q
	+A8sFTvgf9Cl5LaEwFKRgZWlv5wl6P28hVB/fG6lxSeFZCI5BzrVpy9L937dQrTzRYCU7c9U14j
	9U1fUEFilhN9fFQwWWB7yKGIT2zA90ug/Dlb0R4hb0/3quHRJDOmB3DeLTQV8Cd0wtfFQzT7IQL
	eohfVdVtPvTu6O87kI4E=
X-Received: by 2002:a05:600c:16d5:b0:4bb:732a:2837 with SMTP id 5b1f17b1804b1-4bb732a2af5mr21460175e9.1.1794818522364;
        Mon, 16 Nov 2026 00:42:02 -0800 (PST)
Received: from Nuel20.localdomain ([105.112.221.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb62d5ec30sm284300555e9.15.2026.11.16.00.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 00:42:01 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: Tianyi Gao <tianyi@cloudflare.com>,
	Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	kuba@kernel.org,
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
Subject: [PATCH net v3 2/2] selftests: net: veth: propagate bad-settings check failures to exit status
Date: Mon, 16 Nov 2026 09:41:07 +0100
Message-ID: <20261116084107.6675-3-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116084107.6675-1-emmaonana18@gmail.com>
References: <CAG4wq-cd01i7YrcFPmma=BXUcwn_PK=wneKW=vyEBYzQ3Bn7QA@mail.gmail.com>
 <20261116084107.6675-1-emmaonana18@gmail.com>
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
Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/testing/selftests/net/veth.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 5c1dbe1516bb4..0b173beed3442 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -474,7 +474,7 @@ if [ $CPUS -gt 1 ]; then
 	printf "%-60s" "bad setting: XDP with RX nr less than TX"
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} \
 		section xdp 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 
 	# the following tests will run with multiple channels active
 	ip netns exec $NS_SRC ethtool -L veth$SRC rx 2
@@ -483,7 +483,7 @@ if [ $CPUS -gt 1 ]; then
 		section xdp 2>/dev/null
 	printf "%-60s" "bad setting: reducing RX nr below peer TX with XDP set"
 	ip netns exec $NS_DST ethtool -L veth$DST rx 1 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 	CUR_RX=2
 	CUR_TX=2
 fi
@@ -491,7 +491,7 @@ fi
 if [ $CPUS -gt 2 ]; then
 	printf "%-60s" "bad setting: increasing peer TX nr above RX with XDP set"
 	ip netns exec $NS_SRC ethtool -L veth$SRC tx 3 2>/dev/null &&\
-		echo "fail - set operation successful ?!?" || echo " ok "
+		{ echo "fail - set operation successful ?!?"; ret=1; } || echo " ok "
 	chk_channels "setting invalid channels nr" $DST 2 2
 fi
 
-- 
2.43.0

