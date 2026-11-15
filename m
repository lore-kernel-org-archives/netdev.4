Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794771349;
	b=mSAYiJ+Nhtz51LUzp5DL+bzwFRH0jPqC2alsKy8QUtJz1PdCpN9Y+XBp5hZhs71oRoIn
	 kCIRohm985MIEjku/a9TeLxT+cgsn5n4oCenWJskZZeqlZRGUTIC4pQPb7Q9yitaQQl1l
	 AMWNIpygUggBHlXf4LrCDDQ7UmEPrCKnCMoZ+HGknpWwM8p8vaq9z4so82lEEVlhleJgl
	 u8SUIiYeWMpKR9IYZiBl0VRju2nHxKAHYAGO0Fswd1uw++nR7k1cEf16BS2xy6FiIRRnH
	 t55OHBeNlxLlbbgAj9qwvZJEa6AsCubbmQ/hfhFgnBRGxL67GWuCLQRSgjwXxQ1GLtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794771349;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F1yhPQtGuQiIVxyFRyGRvPMKXeA34EsZZQXwH34MUDA=;
	b=wIAINESEmDAFfAV1dvxT4PnKGq5KVgvsd16C9uFKf1EH/dlQfSSEY+FstECcoGZB5spS
	 4p/gxO0FvpIPYASyzw7IoPAz+52tjzLUyLQBmI0OfUU1ObbbnaIwm+uLUSF94H/cEsYEz
	 Pf8b91li45v/dw2kwNdQ79YqdFINoSTKxvbAPeHXsQaGS08y9tNxgSnBoZIbIfMtpBA5/
	 rUxEQirber2A/Kf1atyS9WyeLqW2zAbtvQQNBYJRQnhemyQlz79PyocvycGhVZTWfuF6e
	 XAK3znz6y8TC2/WPyxL7Bstsw5KNFqzWVc9kcr8qcjAKXNJKAo83p/CFTE58ApIT2gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Ddd1tPw9;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F62606A88C
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 19:35:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7F62606A88C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=Ddd1tPw9
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so529098966b.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 11:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794771346; x=1795376146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F1yhPQtGuQiIVxyFRyGRvPMKXeA34EsZZQXwH34MUDA=;
        b=Ddd1tPw9RAVNYmD12nYH3+lDIsw1GToia/TS6/59V68w+pW8wA2Ki3VhpKYAmnAnO2
         jeIup19iPB0uS7rCH8PHJknGTdquhpQx2Qjpmmka9fpGIOzuEmYt9M8ptEi6A3JxT3sW
         8/5pEYQxQBHdAfY4aAei+Fe/QAvKlUNOfVgnhjlqSKYKTBbZho6GMt7Gb3uOropgCzPy
         a23XRIktJ0XNMq4SRpqeM5KE18pG/hlNQY5EGHXdW2tj9yQRW76VFLzawNBjI1QEyEIW
         OG7/xrshCkTwNomu8g7+z4o1ieIbvizWy6KJncCgY85zVeU9d1mOPszv4TDP4XwOUcee
         L2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794771346; x=1795376146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F1yhPQtGuQiIVxyFRyGRvPMKXeA34EsZZQXwH34MUDA=;
        b=oCXuQ5P2DX9qSnTkAa8aqBoTLliZEjC5RGkq9MEv6lOFq4ZFW6L2YRVJbUz0m+mJ8z
         y/2/McSh9K0VQ+c2Ac8/PwnUtqooIFYgO0QwdB3wYAubWiYecx1CGnR8AGBy/nAqoASC
         7tD2vXQVo5iQ0Tu6HU10UdrknthWtolmboan3EFZ5GGxtRRAPxKu2LQ7RJ8f/UxWMMU0
         COyghOMaIMX8uhgrA6LQKIzTMwEZMu1R9P45iN8+oIspKFLEMgCNgs9L0Fs4ws6pSPGa
         OPjw6S5Au6j8AiC3TmzNq7KjMjsU9GTlLt6YagdcygdkpZPelu+SnAk7ndNvksqeN5Q2
         IbWQ==
X-Gm-Message-State: APuU4Z8+Q/vXp8+Jx7+cq6yGeGvdYXuXza3NgmoOoEGNRpivzuyAjvb+
	BQjMT99ZAj9UNoaRFZDD2oKIEGDJpL2FUXro0lSx1tdVLohXrNLy8Vy51xaZz5bx2mCyRcdVPW9
	I+vw22Ok=
X-Gm-Gg: AYBFou1Ss/mr3TQE+HldOow9avThixyX1cgl6Nb9aYlWfN/Uhu3eIgy1Pow1iuLY95c
	+1ocnB/sOVzuXnJ+Q1YiqL3ipvNEdhS15AO6xPx3TSzyixzYmZxe89A0BdE4DVRnOfHkaApH/ZE
	FnlbynRX+Cbpuk0KwTvZwI+cga1oRuGMXeH7ZU1rrtr4QKrD/O653bKcz0Bs3Ij/1vy1c8Gvczk
	7ugQPUcujUAXGMB0nkLADsgm9uc791AcYC2ZoK99woK8kJ6reJZnB9FqSe3VnAoy6mlc9INY8aD
	Zl3TsudH9AUzHvm9rjbN1IVUhODBlO266JyGrnEBIB5vWEtMlO77k068IPI0XlLGdU3C1nu7mVf
	Ehc5+RS4PBQ3UPnonfFToS27KV2sAeMK1+8eJWvJcAJzdmEDhA0A0V9aXHvfGsfxofw93d/gcjT
	ofdVu3w9477RjBoU62Av8w0yZaNWPC2GeONACHoAbiiQVFhXkkbiVNOwkc3AwSWj13MU2oWwp4T
	NAhbTvyqF5rorplMweNg838NZngNMg80fGlY/0Ph3Ar9mK8Zh0aMXkXCGI3pmzsPpvBmP+WKWek
	hUJlD7x3mj3L/kgHC2RuH6YpmcvaRtv2OQZ1YGYYD6lvkdCc0i2pUI1uhFo=
X-Received: by 2002:a17:907:94cb:b0:c2e:3a72:ffbd with SMTP id a640c23a62f3a-c5096389759mr692569266b.41.1794771346212;
        Sun, 15 Nov 2026 11:35:46 -0800 (PST)
Received: from L9JK9NPFH9 ([104.28.20.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm340448766b.16.2026.11.15.11.35.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 11:35:45 -0800 (PST)
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
Subject: [PATCH net-next v3 5/5] selftests: net: veth: test that RX queues keep their NAPI IDs
Date: Sun, 15 Nov 2026 19:35:31 +0000
Message-ID: <20261115193531.57679-6-tianyi@cloudflare.com>
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

Add a check that each RX queue keeps its NAPI ID when veth deletes its
NAPI instance and adds it again.

get_napi_ids() reads the NAPI ID of each RX queue with the ynl CLI. The
test saves the IDs once GRO is on. chk_napi_ids() compares them with
the saved IDs after ethtool -L raises the number of RX queues, after
XDP is attached with GRO off, and after link down/up. A failed read
fails the check.

Signed-off-by: Tianyi Gao <tianyi@cloudflare.com>
---
 tools/testing/selftests/net/veth.sh | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tools/testing/selftests/net/veth.sh b/tools/testing/selftests/net/veth.sh
index 685209995485..9496b599d722 100755
--- a/tools/testing/selftests/net/veth.sh
+++ b/tools/testing/selftests/net/veth.sh
@@ -148,6 +148,30 @@ chk_queue_napi() {
 	fi
 }
 
+get_napi_ids() {
+	local ns=$BASE$1
+	local ifindex
+
+	ifindex=`ip netns exec $ns cat /sys/class/net/veth$1/ifindex`
+	ip netns exec $ns "$YNL" --family netdev --dump queue-get \
+		--output-json --json "{\"ifindex\": $ifindex}" |
+		jq -c 'sort_by(.id) | map(select(.type == "rx") | ."napi-id")'
+}
+
+chk_napi_ids() {
+	local msg="$1"
+	local ids
+
+	ids=`get_napi_ids $2`
+	printf "%-60s" "$msg"
+	if [ -n "$ids" ] && [ "$ids" = "$NAPI_IDS" ]; then
+		echo " ok "
+	else
+		echo " fail - expected $NAPI_IDS found $ids"
+		ret=1
+	fi
+}
+
 chk_channels() {
 	local msg="$1"
 	local target=$2
@@ -492,11 +516,13 @@ if [ -f "$YNL" ] && [ -x "$(command -v jq)" ]; then
 	chk_queue_napi "queue napi - default" $DST 0
 	ip netns exec $NS_DST ethtool -K veth$DST gro on
 	chk_queue_napi "           - with gro on" $DST $RXQ
+	NAPI_IDS=`get_napi_ids $DST`
 	if [ $CPUS -gt 1 ]; then
 		ip netns exec $NS_DST ethtool -L veth$DST rx 1
 		chk_queue_napi "           - fewer rx channels with gro" $DST 1
 		ip netns exec $NS_DST ethtool -L veth$DST rx 2
 		chk_queue_napi "           - more rx channels with gro" $DST 2
+		chk_napi_ids "           - same napi ids" $DST
 	fi
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
 	chk_queue_napi "           - with gro and xdp on" $DST $RXQ
@@ -506,15 +532,18 @@ if [ -f "$YNL" ] && [ -x "$(command -v jq)" ]; then
 	chk_queue_napi "           - after gro off" $DST 0
 	ip -n $NS_DST link set dev veth$DST xdp object ${BPF_FILE} section xdp
 	chk_queue_napi "           - with xdp on" $DST $RXQ
+	chk_napi_ids "           - same napi ids" $DST
 	if [ $CPUS -gt 1 ]; then
 		ip netns exec $NS_DST ethtool -L veth$DST rx 1
 		chk_queue_napi "           - fewer rx channels with xdp" $DST 1
 		ip netns exec $NS_DST ethtool -L veth$DST rx 2
 		chk_queue_napi "           - more rx channels with xdp" $DST 2
+		chk_napi_ids "           - same napi ids" $DST
 	fi
 	ip -n $NS_DST link set dev veth$DST down
 	ip -n $NS_DST link set dev veth$DST up
 	chk_queue_napi "           - after down and up" $DST $RXQ
+	chk_napi_ids "           - same napi ids" $DST
 	ip -n $NS_DST link set dev veth$DST xdp off
 	chk_queue_napi "           - after xdp off" $DST 0
 	cleanup
-- 
2.56.0

