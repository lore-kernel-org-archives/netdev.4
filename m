Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795774971;
	b=scNoIACTzrmhtnoALsn3u/9CU4uc2wjpCGRiRVL6cHTuE1EKdPAtFpjBkaBLGyWI69uC
	 jAnRcPkhwxZw2foHBKxQFseoyFdtkNpcHF8KKYtrrUaFW5FnqgP02MHlcYbk8A2vrdTd0
	 KxiTSieHtmPeWvuaOPnpH37zfSil2dOWmE62ZxUbXGPPam4ZgtzMs/d3dF3g1k0Rcg0cJ
	 JoMmiqrNXc4NjuL3/Bl1Lf3XQP3o4vXelEiA6TEHs78L3sYL4gDAeTYsbxebXc0k2r4VB
	 BqmeCShgeQNfpE40VRRhX33OyIS/smD1pZhqGpTJkWC2MP9g3S+bGtWzwE10czB7mPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795774971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
	b=NEiB+F3tFTqnQojc9Y4faHFwAX4QNLdXlAcEt0LlUIXPp+HUK5wR3VShhRWwU3dbNcLJ
	 tHvIkbKOG8LnvTaS91lZ3YHOm1zlHDmo/AbLq7he7j090TJkIUX14E1ssYVhJwklz/+vN
	 MdtqunloHCRFDiyreBw11p9UNFVWNo749hxia/zJLuZdbCA1ZXpKhCmoX1G20aPG+mL9l
	 g4fy7LydSpQKo1E+NNZxpmKDBnhvr9JIiarhEDrDWqQ0bwevWUioFxS6/aRUi47s1C3+9
	 Sxg1QzjJQlM0YnYIpqJnlBUhNylNBO92tNWuZ73eiGV8jp7dsd6haSxPydsOSIbug4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPY+kzT3;
	arc=none smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB8060A260B
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 10:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDB8060A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jPY+kzT3
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6bab377105dso6843893a12.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 02:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795774968; x=1796379768; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
        b=jPY+kzT35XRacdl/8zgOfvZ99pEl+zFMT597HKM4mIj4QYGbAajvNOjFula5B87lYb
         ziNy+8KI8skqfjiGuaWvwMezqrmQfD3/lAcFxRg1KghJhiZQbcxIHJPSZKHWeeJj0N5K
         M2h8TkcqoVoVFbMoiH2cwak7V4OcW+KQNzCB+VLmsQFLdeJ3A3WqWAUFK10wh0tiGrFH
         fSOVW3C6jDwbY3IqNitahlg4yUqifsfmiUvvxgg9p8Ziz+gc4Y8lljV5TYqN+ZLzcFZH
         qZsc4+zuE45UtBXFqUNbJOC5dsWFOFgK/wpdD1TXcprR5ZloOsmqSjBYDt4SrsrV13Rf
         6Ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795774968; x=1796379768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rcLiYjm+Bw7UNaKZxYLwAijXLTVgk+NU4KBS0kQqv3U=;
        b=tQqVQbDioWUwJjAJQwRPehuFWuHmw5Az7XntanQ+8j47KK1mPzgGCa/rBsjZKIjJIm
         dw+bZdoMysKxjcOxNR5SAzZH3CYcnPTGWcwYlf7JiZ2jfIdxD4uy870XbTMZs47wCTc7
         X/gSNraXV88udGSTDsdBAPRkWnhm9KJL93RtIYtB8UWZHt1QE9CQQL3IiOe24FuKaFMD
         pBGmZE083jyb16v+IK9jPfEQX/v2ooO0vEvcsvE/2IMZqUFoYTtGXgjZLSoFWyZhIyma
         xZ8HSQuvDrtzLC/mcq1T6o8wnxJ+P8buIbsEFNouegCNctNoscSKDakxBGhjZpJLZPzn
         Z8nA==
X-Forwarded-Encrypted: i=1; AL+hErG086YNgL3bEJsnaZ4hEU65kTEYBw2+QucJjpMITGYmu9z+pN+fjcZxf+nswK0Rj3y/+n8PSys=@vger.kernel.org
X-Gm-Message-State: APuU4Z+TChGGAOc0jnAkYNK4l+YxX6raFaB1UhgA+zWq1nFFInJR1UtF
	9pRN9Hiv7WUYiPuHxbcmtz6FEqSNOosZi1GVEVUT+/dXAPuk0p37vvQQ
X-Gm-Gg: AZFdTZeMYiXInOgPEzbFDsuPd7M9eXpoE8ijtzfBW3Hp/tKAp3eK6Qpo/UUBhL7V6qT
	5Q6ffaIDsYl+RR75ealmyREOky2OGbXDyoWxPoi0nFrHpdxeDV9ayD/XWpqjtsGW3vWe2cjc6ul
	7rZ1SCsZshuZGYyApSiD05cYELJzQDS/G2YMY7LK0sOxW5phwKiOGfpOmO7+5Cqv6l0ZGy7aCLG
	3GKyHo9EV5QGxeqO76eIu4Gjt9qUOftLGM5V3c5ITj6i/J3Xn9JIh1471oZc2YcgYT843kvNZ3R
	IV0TmtfL4+H5FMkzdiTMaQimTZezA1WaU/ffeEdlEWQLQRopF2otjadqRV5vnA5KgNZmcScCs23
	cPHT1pFM4ALTzG8l8p7oD/1o6W5iRjMk7PPBMN8w53+0Ai8oFMrnFoKrjeRya3jUDY02bHF1hY5
	6tGKvxmmFualoOzIBNCBuywTHptq/KbIDM6BoSNdMesopmJC6Ul29168m5exb0erTruCaC7VVE/
	37yq+oS0W0PvUVamIIShCLz1o6IS8K4lIGbnyJsBnImOWc71j+bIq9PvEpDq6YPqJt+IyAxT79R
	KNraFJ4p+uA1n5lEfBd/L/WwZFRv1WDI3cpilMKXXXgwpoz53tvI/aMRXzEcRIMgQmJmGw==
X-Received: by 2002:a05:6402:2105:b0:6b8:7e86:3eb0 with SMTP id 4fb4d7f45d1cf-6ba37ec50b2mr16425783a12.40.1795774967795;
        Fri, 27 Nov 2026 02:22:47 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cbb80sm10886407a12.9.2026.11.27.02.22.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 02:22:47 -0800 (PST)
From: Andrii Pasichnyk <apasichnik9@gmail.com>
To: "Jason A . Donenfeld" <Jason@zx2c4.com>
Cc: wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 2/2] wireguard: selftests: remove a peer under load
Date: Fri, 27 Nov 2026 12:22:43 +0200
Message-ID: <20261127102243.49405-3-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127102243.49405-1-apasichnik9@gmail.com>
References: <20261127102243.49405-1-apasichnik9@gmail.com>
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

Remove a peer while a UDP flood keeps its receive queue busy, re-add it,
and repeat ten times. Packets left on the per-peer receive queue keep
the peer and its keypair alive, which the created/destroyed object check
at the end of netns.sh reports as "merely created".

The ping after the re-add makes the new peer handshake at once. Without
it the other side keeps using the old keypair until its own timers start
a handshake, nothing flows in the meantime, and only the first removal
happens under load.

netns.sh sets message_cost to 0, so every removal under load logs up to
1024 "Packet has unallowed src IP" lines, one per queued packet. Ten of
them overflow the 256 KB kernel log buffer; the object check then reads
an incomplete log, reports peers as "merely destroyed" and can miss real
leaks. In the worst case the loop logs about 1 MB, so raise
CONFIG_LOG_BUF_SHIFT to 21.

The loop adds about 13 seconds to a run. Without the previous patch it
fails in every run with NR_CPUS=1. With the default four CPUs the leak
is hit much less often, so NR_CPUS=1 is the configuration that checks
for it.

Signed-off-by: Andrii Pasichnyk <apasichnik9@gmail.com>
---
 tools/testing/selftests/wireguard/netns.sh         | 14 ++++++++++++++
 .../testing/selftests/wireguard/qemu/kernel.config |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/wireguard/netns.sh b/tools/testing/selftests/wireguard/netns.sh
index a8f550aec..8303802c0 100755
--- a/tools/testing/selftests/wireguard/netns.sh
+++ b/tools/testing/selftests/wireguard/netns.sh
@@ -207,6 +207,20 @@ n0 iptables -F INPUT
 ip1 link set wg0 mtu $orig_mtu
 ip2 link set wg0 mtu $orig_mtu
 
+# Remove a peer while a UDP flood keeps its receive queue busy, then re-add it;
+# packets left on the per-peer queues would keep it from being destroyed,
+# which the created/destroyed check at the end catches.
+for ((i = 0; i < 10; ++i)); do
+	n1 iperf3 -s -1 -B 192.168.241.1 &
+	pids=( $! ); waitiperf $netns1 $!
+	n2 iperf3 -Z -t 2 -b 0 -u -l 64 -P 4 -c 192.168.241.1 >/dev/null 2>&1 &
+	pids+=( $! ); sleep 1
+	n1 wg set wg0 peer "$pub2" remove
+	kill "${pids[@]}" 2>/dev/null || true; wait "${pids[@]}" || true
+	n1 wg set wg0 peer "$pub2" preshared-key <(echo "$psk") allowed-ips 192.168.241.2/32,fd00::2/128 endpoint 127.0.0.1:2
+	n1 ping -c 1 -W 1 192.168.241.2
+done
+
 # Test using IPv4 that roaming works
 ip0 -4 addr del 127.0.0.1/8 dev lo
 ip0 -4 addr add 127.212.121.99/8 dev lo
diff --git a/tools/testing/selftests/wireguard/qemu/kernel.config b/tools/testing/selftests/wireguard/qemu/kernel.config
index 368fd9d60..1adf7cb6e 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -67,7 +67,7 @@ CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
-CONFIG_LOG_BUF_SHIFT=18
+CONFIG_LOG_BUF_SHIFT=21
 CONFIG_PRINTK_TIME=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_LEGACY_VSYSCALL_NONE=y
-- 
2.43.0

