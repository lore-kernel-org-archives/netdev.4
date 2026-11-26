Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686452;
	b=RmBD5VQGFdVoZ8qv3yvytP1PFPlJKh25ARbbJ3sAt52qxli0IpPE7Jk6oDYl4tEgn38W
	 c3dUI470aoW6HQFkG1d7wMtVPCl3LQxJHfqKIH384QVrUIAXXweoR4/5zOVJinO8tbiBA
	 KQY2fBIRzK0VTv/HD1QG61PAfha0V4ROLCRkLJbyH6UAIEM06kqTdl+aVBdRp9NFJ9SRl
	 LZIH1jBD75TJ9ojNU70kA3aa67GuYZLbOrQDcy+jBzuxBPBBrHVCR4fKDOWCdbTatdxod
	 WXZPhmhIogQDwONK7mIuNnmB4ah4j31eaK6oOOncYAlbpJlYxe2pIbfmuZoWou0lCUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UH2IMeYVxT8rS/5LnU9w8cMAnO78HMIPaSbsms7ayDw=;
	b=KHfXLdFqJXVFmiAn+oF1jEALlYuiZsikt+9DADxHimG/iSTpl7c/Rp0XEpdEt7T2p4kB
	 T3FmoAZq2Ar5vtDl849BR5LItyTLcYla2klG7MJGkdH5c5h05xszu2R8W/P/NTitE+aQt
	 ecEApIwU7QyyRF42qGes46O30CXkvgPyct1johGRiQ3NaVgZO4LSLYWElJeYlzGPEYTz0
	 AkK7TmV0CRBSpnuRREqD+9MBthe6gdbSIUPc45mSyweZom0WSbn1vDiXJsMKibwJ5vpHj
	 YzYwxOHiumOxV/GFccIeYmQaf95XHZY8touaDDX+X7wek1ggrfr/R3rvwimBTq58OAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnnoxC4n;
	arc=none smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5FF606A33A
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D5FF606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YnnoxC4n
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c513a854320so233280066b.0
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795686451; x=1796291251; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UH2IMeYVxT8rS/5LnU9w8cMAnO78HMIPaSbsms7ayDw=;
        b=YnnoxC4nsRl4dppSaIG6h0tMBVgv0V89ea9FGpoYNF7Ypd0OfpXOJgp2neQLwh4+vk
         PD9wTqwuVTrqa7n6TEVaPW6UYBdexjFzc16At8pyR2rvEUS7gmFw5PMvNH8IAhZWu3Dm
         ui0Pd5xm1h0V2uPamOuvocqwke/O0nt8Hpu91bcd3yj61LPsJ12mfSk0k0MN8iHtB1K9
         k/YJJ5G8wsyl9mJ5wrJdR0sFkJgoFRtzu5NZ8SqgaqQnDwKmuiZiTKe2EFGuFw9IB4/0
         NHO5EsXrW0chnRa86+dVM6ObnRQAsbc3LxZIBC0s2FvCTkn/3mT7kR6LbH8y/AIoLQis
         ZhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795686451; x=1796291251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UH2IMeYVxT8rS/5LnU9w8cMAnO78HMIPaSbsms7ayDw=;
        b=QNPaHOBPuSGMiz0YwtrvNQBRnk/lE48t+/aC0OpcY2UxFm6LSpn2SMaYWHezqxXE1n
         rOYSNoYbh6P1/cCPjag8hgSquAzACHQkT2xD1C1Zk1ORe0zsGWZnf40HtlxtTH5XlY9E
         C3eaHk0DPBW/29I3EFUoKf+ntPkkR9LukkInLYLdhE07rnV9h14h0A1JAwz3aBy0Q2GU
         kcpPV0o0zSd8h8m/aMxHogkEnp6zXO3TzRqyxOiumSr95iyfeDyVrvXXwdT0Uz2mVgRg
         TM3D/ITwhlRjMo8Ct7z2akuF0tt4giUhRwPG/3D4mpqq3My/0I3dhqNyutpKloIcceaT
         ao+Q==
X-Forwarded-Encrypted: i=1; AL+hErG4/cK8W7JamBYYAz9i1Zx1YVa/6i3+WGPpTI8wgeU5UW/KL4XfLbOzzMTPSJsbXyDtFgpBYPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qwsqKMZflmSSR4Db16HYPd+Q/76GV8HxzjpZBXK8GlDLHeFRp
	0JSrJcqZeks03f1laHFWAheRCCQUEf69nDK4V0MthEcy+aPMwELm0eWZ
X-Gm-Gg: AZFdTZdzvHzOmgWF0hi8FGdVp28vpFeF3Z1xRHHKr03U7HrdtJWJHqV+r4YMh0ZgYOA
	6cvNzZLmBjUwPTJ8FhPvHTT44DSbznvsTz27ifM08z2zHlTcnzZI76lPep8EW+LLB1OJkSxL7MK
	4WotpzVm+IS4xnNkjjoNlk3WoAjCfUikZjIOkafzHbVsqjh2VQnV0CHgBTISfZIGkRM+4QMPBio
	8AOH9U9NbXi1Pa4JtPmP1gv5SU/ljyE9iegmvYw1zPT/PwCWFiGt1XJqIPCH/WljT19br1kcxxQ
	N7Idt2UTil95etDVX+QFdzQ8cP6YjZWLDr8smah1zarppHV5OQMbPOlcS/QRPPK1eMY9pEE21lY
	/88LS7doE6RPsvxY8KH4wmK9CMWlNkoPrF4M8v/5apfV75IUIW8AxMvsx/a64N4kCPw+I0pkG4Z
	mVRRFLAWELYW5WWXWbrpsq25Y9/qdeb6DGxxrPRLU8SVRZIKRKbGvSvsyN5yLrIKlZVKbVrEaUJ
	ODBKq2GoB4RRudROgRHy9KMdAP1khGjVSFv6+/KVFeJb9KeqJOW2/F+BUSetBnDB60x4l+3oVz5
	86PjEthOJw+Umegot5Gu3KBxtfFyko1FbEMOyeWdzB/vF544
X-Received: by 2002:a17:907:bb48:b0:c2d:c98f:4824 with SMTP id a640c23a62f3a-c513a9af930mr1554663266b.30.1795686450911;
        Thu, 26 Nov 2026 01:47:30 -0800 (PST)
Received: from Air-pasichndev ([188.163.8.107])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b002b9fsm727100666b.78.2026.11.26.01.47.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Nov 2026 01:47:30 -0800 (PST)
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
Subject: [PATCH net v2 2/2] wireguard: selftests: remove a peer under load
Date: Thu, 26 Nov 2026 11:47:22 +0200
Message-ID: <20261126094722.73025-3-apasichnik9@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126094722.73025-1-apasichnik9@gmail.com>
References: <20261126094722.73025-1-apasichnik9@gmail.com>
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
and repeat ten times. Packets left on the per-peer queues keep the peer
and its keypair alive, which the created/destroyed object check at the
end of netns.sh reports as "merely created".

The ping after the re-add makes the new peer handshake at once. Without
it the other side keeps using the old keypair until its own timers start
a handshake, nothing flows in the meantime, and only the first removal
happens under load.

netns.sh sets message_cost to 0, so every removal under load logs up to
about 1000 "Packet has unallowed src IP" lines. Ten of them overflow the
256 KB kernel log buffer; the object check then reads an incomplete log,
reports peers as "merely destroyed" and can miss real leaks. Raise
CONFIG_LOG_BUF_SHIFT to 20.

The loop adds about 13 seconds to a run. Without the previous patch it
fails in every run with 1 vCPU.

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
index 368fd9d60..c69a408a5 100644
--- a/tools/testing/selftests/wireguard/qemu/kernel.config
+++ b/tools/testing/selftests/wireguard/qemu/kernel.config
@@ -67,7 +67,7 @@ CONFIG_SYSCTL=y
 CONFIG_SYSFS=y
 CONFIG_TMPFS=y
 CONFIG_CONSOLE_LOGLEVEL_DEFAULT=15
-CONFIG_LOG_BUF_SHIFT=18
+CONFIG_LOG_BUF_SHIFT=20
 CONFIG_PRINTK_TIME=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_LEGACY_VSYSCALL_NONE=y
-- 
2.43.0

