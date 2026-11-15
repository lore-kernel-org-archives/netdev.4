Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771349;
	b=DUub6+QwHTJ+h6QNP2VXQDqciDN5oLAv2htibi7zKkYTAlbGaHvBi3WhQ4LQqf2rWXGH
	 iEednBPa578GCiNltVsEFtfSKDdyhCHazjkHX4t1bQZCJg7d5N81NHkMZe9N7GJEX16S9
	 aahf2aV3RORg/nxyOmqEMaamgTIXkrUtsn4yd+EVqd1EoUcJjocSrH0T+eb6xSfrxIgIj
	 Wme2HRnoGz2UGwTNSosFCztiJPwzS4VShM/HGcBtSh6er+XnupvpIb/eRPMoc5Nf/k/5f
	 t0qThPDEvZVS+TCtFSYucnADFuETDrhgbNttzO8LX3DeS7Oj6UPC82nxgdTqfSuBERw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tK8pY04ULzlkXT8YAD8XuTJKOa5LokDbsoPvaMBMCag=;
	b=pthfN6NPX7YGHs+PP8MIamGTGcixgn3GRKTxKUNjkgecRVMvOHVHwMZEFNPUd2Jzsq8v
	 ZJcBjKT3HHxkFvt6WRqsRttEdQwl5NtagRJLbVQYOmTEb4SaQ/ioi+oqJ7/e/61IYX/bF
	 IRfY9SMPxV4RQ3D85xw2G95pGnJAdgkfbpyHleX1CrspeOs7FZ3H5N7RnEoy8MCFnmqSh
	 JD/XPmAt8DCXRum4x2mSS1UysgXgy98w2W3foHE5LIUjQc6i37beJVpmzJfIgGPSHye8x
	 eVbGEagH0sU+wX5mjOB4gboBJp0g3Ec3nHVmoVdupgP7zqPev3pGNqCEyxx7KQUdirg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MMyf1xFt;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE244606A88A
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:35:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE244606A88A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=MMyf1xFt
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c50e26763a4so958366b.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771343; x=1795376143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK8pY04ULzlkXT8YAD8XuTJKOa5LokDbsoPvaMBMCag=;
        b=MMyf1xFtg5f7mLaOMXYxwa47KeuCHgfiZd8RIsmV+iKswcuNbpdOy7R6jGAcXURrwd
         F9fdnbsev7jw10wt1hakRflYdyGA/wcopixTTlIQ/KEcoddgo6WPW+gC2I9Qzz7PVxw3
         xWoqQ3exgnLR2Qx0ckTJQAR3Uf55mo3ZyB0Svwq3WvRzn5depXvTQ+5SWPVKzCf8KKKV
         thiKRleMyXRmUXqkjy2I+ufHBP25FpqQXotf8fiA95joB47SvZzHwHSUa51oX20TSRIj
         Z17FItr8Hz2yhbhmP0lO0jxZzI453u/Vx8IdaXeKXw9avYW3DIDDKNkU3owggpV1YVXM
         qpOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771343; x=1795376143;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK8pY04ULzlkXT8YAD8XuTJKOa5LokDbsoPvaMBMCag=;
        b=z5mlSYxBnfS1a4rxbpXZe9Hi0x/AMbRzLP4WVzdn34lO1upEfSw1wBtFatypB3r4k9
         T55e7e04GEZxJrKcnlz1QR/Bc4SO7WZjiePI61Rk5flnBxZjY8QyYIWZAxvyy9Cl9UP6
         m3w0DLUtPDERJzZs6ZBQvIo+QsrN71YBUpuul5verX4TfBb+TkKYcLk/rXOYDqVil1WU
         KdnkC4gYnBs8ODhmNlNz9qTJ5Irh2A5s/gBwFlYWp4aQwY/L9mPmTb1a3nZIyY71y4Yq
         Mgq8u8g1Q/WOoZ5v7RRFtBTzKnvmCLSFHVoD/Pcf2P0CPYrSmh64BIughnzlEGYcBLnd
         IGPw==
X-Gm-Message-State: APuU4Z+9Y0LHnPHG/tCtPNcHa9/4I2SbawO3JppgDBWwXxJ9Ra+sr9S4
	0k5qBsHInd5k2Dx6cynjDmP5p3LoLbFvv2qTaG7Ielu+CjTJ2MqEvPobj2Bf2Y6/43maRwqi4BC
	UE1SOq/4=
X-Gm-Gg: AYBFou1b7j1baOgMiC6S0Vo/xNNYVaC4Etw4P28bqICaAETqKVyfU9i89ih5SW7KbkR
	6wRNvvlgtj/ScdzHVUqZZI8cH9lWURVcW/XoMfUI1m1zc8V1tU87UrW9jnWY5oi3KvqReGd4njs
	+iPIt22/BnM5bF9y+7Uuob5neW4X06iGsgdb4jx5BwHvkDv8aJLNJLIkjX07Ao+vqbwqGwvzafF
	9uB1Y9dJOy5lE52qnEKBMEuVgvWaxFbe4FEsfZhfD231xuewouA2vQoFiSAuud1BQKpNHKIkEyR
	/hKJ/bBP+8DUtXuAeql9/R/Dw+sra9xKT6Azqv7OhEoesFXrrmTaGpURyitPtC2LDXBqboOmWQ+
	EeR8Y3N0QJZ2T206AZ83rUJ62g1gtcwrNpGcG4GbvF/NHrJbnKy/pJgCzPnnByU6rmek0iWuLkN
	06im/KBJG24AiPd+K9JpQ4uTNbV5fWGjU/69W8BvJyP14vkSPySQFovley5WlVN96NyE2WNJ5P/
	eIS21mGOKLHMv5fMPIvDvInE9HC3mamP1R+htGIBFirNH8KTd5ULX8j5by7Pn37bY3/pT7zJNwa
	rAHfirKAcM8EeIbidJ/+vBtB0bPulAd2YsE8d7gvaotP55WTYelf5dBPsbBUX5gRDxLYe2vLM12
	8zos=
X-Received: by 2002:a17:907:c05:b0:c2e:378c:8ce3 with SMTP id a640c23a62f3a-c509634a522mr696307566b.32.1794771343416;
        Sun, 15 Nov 2026 11:35:43 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:42 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: netdev@vger.kernel.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	toke@redhat.com,
	lorenzo@kernel.org,
	horms@kernel.org,
	shuah@kernel.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	hawk@kernel.org,
	john.fastabend@gmail.com,
	sdf@fomichev.me,
	joe@dama.to,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	kernel-team@cloudflare.com,
	tianyi.gao@linux.dev,
	Tianyi Gao <tianyi@cloudflare.com>
Subject: [PATCH net-next v3 3/5] selftests: net: veth: test RX queue NAPI links
Date: Sun, 15 Nov 2026 19:35:29 +0000
Message-ID: <20261115193531.57679-4-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261115193531.57679-1-tianyi@cloudflare.com>
References: <20261115193531.57679-1-tianyi@cloudflare.com>
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

Add checks that each RX queue is linked to a NAPI instance of the
device while NAPI is enabled, and is not linked otherwise.

chk_queue_napi() reads queue-get and napi-get with the ynl CLI, as the
ndo-xmit checks do. It checks with jq that the napi-ids of the RX queues
are the IDs of the NAPI instances, and that the expected number of
queues is linked. The checks run with GRO on and with XDP attached, and
across RX channel changes and link down/up. They are skipped if the ynl
CLI or jq is not found.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/veth.sh | 79 ++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 64c2a5a59821..685209995485 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -110,6 +110,44 @@ chk_xdp_feature() {
 	fi
 }
 
+chk_queue_napi() {
+	local msg="$1"
+	local target=$2
+	local expected=$3
+	local ns=$BASE$target
+	local ifindex
+	local queues
+	local napis
+	local st
+	local linked
+
+	ifindex=`ip netns exec $ns cat /sys/class/net/veth$target/ifindex`
+	queues=`ip netns exec $ns "$YNL" --family netdev --dump queue-get \
+		--output-json --json "{\"ifindex\": $ifindex}" 2>&1`
+	st=$?
+	napis=`ip netns exec $ns "$YNL" --family netdev --dump napi-get \
+		--output-json --json "{\"ifindex\": $ifindex}" 2>&1` || st=$?
+
+	printf "%-60s" "$msg"
+	if [ $st -ne 0 ]; then
+		echo " fail - ynl cli error: $queues $napis"
+		ret=1
+		return
+	fi
+
+	queues=`echo "$queues" | \
+		jq -c 'map(select(.type == "rx") | ."napi-id" // empty) | sort'`
+	napis=`echo "$napis" | jq -c 'map(.id) | sort'`
+	linked=`echo "$queues" | jq length`
+
+	if [ "$queues" = "$napis" ] && [ "$linked" = "$expected" ]; then
+		echo " ok "
+	else
+		echo " fail - expected $expected found $queues napis $napis"
+		ret=1
+	fi
+}
+
 chk_channels() {
 	local msg="$1"
 	local target=$2
@@ -330,7 +368,8 @@ fi
 
 [ $CPUS -lt 2 ] && echo "Only one CPU available, some tests will be skipped"
 [ $STRESS -gt 0 -a $CPUS -lt 3 ] && echo " stress test will be skipped, too"
-[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit tests will be skipped"
+[ ! -f "$YNL" ] && echo "ynl cli not found, ndo-xmit/napi tests will be skipped"
+[ ! -x "$(command -v jq)" ] && echo "jq not found, napi tests will be skipped"
 
 chk_channels_carrier up up || ret=1
 chk_channels_carrier up down || ret=1
@@ -443,6 +482,44 @@ else
 fi
 cleanup
 
+if [ -f "$YNL" ] && [ -x "$(command -v jq)" ]; then
+	create_ns
+	RXQ=1
+	if [ $CPUS -gt 1 ]; then
+		ip netns exec $NS_DST ethtool -L veth$DST rx 2
+		RXQ=2
+	fi
+	chk_queue_napi "queue napi - default" $DST 0
+	ip netns exec $NS_DST ethtool -K veth$DST gro on
+	chk_queue_napi "           - with gro on" $DST $RXQ
+	if [ $CPUS -gt 1 ]; then
+		ip netns exec $NS_DST ethtool -L veth$DST rx 1
+		chk_queue_napi "           - fewer rx channels with gro" $DST 1
+		ip netns exec $NS_DST ethtool -L veth$DST rx 2
+		chk_queue_napi "           - more rx channels with gro" $DST 2
+	fi
+	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
+	chk_queue_napi "           - with gro and xdp on" $DST $RXQ
+	ip -n $NS_DST link set dev veth$DST xdp off
+	chk_queue_napi "           - after xdp off with gro on" $DST $RXQ
+	ip netns exec $NS_DST ethtool -K veth$DST gro off
+	chk_queue_napi "           - after gro off" $DST 0
+	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
+	chk_queue_napi "           - with xdp on" $DST $RXQ
+	if [ $CPUS -gt 1 ]; then
+		ip netns exec $NS_DST ethtool -L veth$DST rx 1
+		chk_queue_napi "           - fewer rx channels with xdp" $DST 1
+		ip netns exec $NS_DST ethtool -L veth$DST rx 2
+		chk_queue_napi "           - more rx channels with xdp" $DST 2
+	fi
+	ip -n $NS_DST link set dev veth$DST down
+	ip -n $NS_DST link set dev veth$DST up
+	chk_queue_napi "           - after down and up" $DST $RXQ
+	ip -n $NS_DST link set dev veth$DST xdp off
+	chk_queue_napi "           - after xdp off" $DST 0
+	cleanup
+fi
+
 create_ns
 
 CUR_TX=1
-- 
2.56.0

