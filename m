Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795786120;
	b=aMvmhvz90Pod+rWGfx2t0Tkkd99jH+al3Wamuq2wji4pGMA9JmvutBLkeZq1pUBqQqna
	 NxV38goHmTB1lFb6YB7qPFAfeJIZzv9if5JOAEQidhZ+4J2em8EqEpXhVmrjYOkIiplpy
	 r4Zrrol+QCsBB5vEGQejtPiU+kd7YGfK53pH/24fAg3ShfhQjHYFEIWVjZ8ywe8F+GzEJ
	 bKRPxFQz9OxYtXjLTBsXpA3AhFKxbZrhql6dJum+gW0Doz/O/k7eA6+oLNQuE24Tq6nVA
	 gVurpDoeM+r4HJ7epaHIPDC8Oxnt1ybaqhnh6SAY5fv7xXBLQ4ku1eg9PMcf1pngzHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795786120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=LLbqNYnO454mMUff5E6gIY1DPjJ0b2afsLpoASZgEQk=;
	b=cXnsPBqp6ZeCPSup5tQRbAjEcjafzt3765W4OGKI8lHDqm+qML5iqaFBHzoIJoa8/5mC
	 MxIpyNaEp6fSyfzR5UIDAAQwEKQQnTnH4KTOvoglVIX4KRQajMcD2HaOnr2+XMUpZYStY
	 YZHD6BWx1Kd0oaStVgBt0E+pb26V4pblpn4802rl45pVNfFb+Y0i8YG1WFHC+A2vfMSXd
	 FRCeM0CV2siVZxa6Aiw6kQpXdhXiPrZ5XJIj0vsbjwXCvspVth6h1LCcJfjCLOXIinqgI
	 cNroB8ChhL9Pr3g32tW5pBHLsMzknRUIShm9mYnl9Dfcoh5N/QEeOSGg6+HMYNT1H/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2jcQoet;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E655606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 13:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E655606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2jcQoet
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so9714659a12.0
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 05:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795786118; x=1796390918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LLbqNYnO454mMUff5E6gIY1DPjJ0b2afsLpoASZgEQk=;
        b=w2jcQoetCxdWtWEsQmQxiJPapWOdd8pI169GJXvJK0FakFi98wi4TFk1BLlpYUAQU2
         KWeT0KR14LzQpVAJb5HiePsKh8A9gwAubgr6jtg22oQDvbnn5gzr8/ThjEqDD5rxv1jj
         fVUf/eW++wAdnuV+27kRHPLnY+2EndJzv7Rw2KVOjK1tI+xrgdMHgBbCj2gyDPWOpWKD
         nUz83u455Xw8SYJLEHQU+72uQMGqrh+ZukK6Zt4l4zpfRM79QCZzKK1fSdhuKaQePV/k
         1cVRwyjWbbbxf2+D7JFsX9Aj4W5iLds1fF/l9r+VL7XgkqAmxpnxDhg/hY7UP6D7S+p8
         /6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786118; x=1796390918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LLbqNYnO454mMUff5E6gIY1DPjJ0b2afsLpoASZgEQk=;
        b=BGvKW8MBL9It7tGreiDKp+P6yNTW1MaethKhc8i6WdHSpha+V84cWu3yvaxw0K66+B
         3p/VClS80Bq+rG8skTezIAm6ABwHoP8tbj+Vr5tEI+dejqayr2sN2xWJaQ7z/ohsvNfu
         ATy4GW2fDXJ+lGOAfrZphtcyiBltZqOVB4pcFW+vuQuvz9foo8sIUlKr8iKkKvbXCVBm
         Oy+py8adYCXUkt3QthR5PHbH8wcXZ8ta1LvRiScMBr2oJ/hdXb0zSVmI+F39epMdCM5x
         opwnTp7KImTxzn7jnL+a4EJ0LGn+nMd1lwpZaOkaXnIltm7YTHaHRhvo7GUZ5AwrnX5r
         7/9A==
X-Gm-Message-State: APuU4Z+X+UIaOMehYpH3NLDODregES3cem8rSwsdV3Uyxb4pauYsBeMb
	y7VdSnCVirbGYhfYzwjFYJMwXpaFKFXwFWsncKVm3IvOW1QIK77Uxat3
X-Gm-Gg: AZFdTZckFBAdhoWgvinPzdMIvADYZB1nbfb/2S76Vu+cDDz4I8Y0AXsFTbO9zbHk5BD
	B+uKyDol29A6UyyQvgyP+mebeT8xqDLaOhdRQGwTyJs8st4T8BT5gHYeTD0OjPn8VpnZWiNZwgn
	RGjhQEYT23uSTpzK54J3iFd8PPTPhMWHXkm7BDIa+YxsW/TuKUlbs7S8N2qGj8nYFmZ5+hpA/RF
	kbzYGKFd6vOMbvZmAfKjzBtEFYsaeHHqLKTkKG7ZRRiErZktPXoQhJ2dHdfm34EwE0qBfSJEIxf
	ghz9P7bR9Tso6zzrQH5pbBsqLKAeQ84bBG+J4U6JniNVNToiSuUg2cm5w6ZDC1DNU79F1nkw9+1
	rcSIV18ou0O66Vas95StNBacnszj1szxTyKEc4j135HhK00ly/YOh4hHgbhtJxnIu0vP6Fzwsxn
	pFr4BFDJ0mggtAlP/ln1pZcCU8XWpJFf488CaeIzW2jdNFytFX5s8L6PCs6vWkFFAAz+m2ZsJ8k
	OAurpJ50tvKOEplOP+4tbQQfpPkCgZIfztxTNBpVK4/5NOkoLHjmnMYgeioXJ4GsL7FDEr4Czuv
	DpoEK4BCxwrvSQCoLZ7jlMlaUDbf5EZ3mesmM/BpU0uvrw==
X-Received: by 2002:a05:6402:5c9:b0:6b5:7de8:87cd with SMTP id 4fb4d7f45d1cf-6ba37edda4fmr17675385a12.42.1795786117728;
        Fri, 27 Nov 2026 05:28:37 -0800 (PST)
Received: from XPS-15.robovision.ai ([78.29.219.39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370e78a7sm10530361a12.16.2026.11.27.05.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:28:37 -0800 (PST)
From: Cyriel Ladriere <cyriel.ladriere@gmail.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	kurt@linutronix.de,
	hawk@kernel.org,
	richardcochran@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	Cyriel Ladriere <cyriel.ladriere@gmail.com>
Subject: [PATCH iwl-net] igb: only pull the Rx timestamp header from the first buffer of a frame
Date: Fri, 27 Nov 2026 14:28:05 +0100
Message-ID: <20261127132804.975014-2-cyriel.ladriere@gmail.com>
X-Mailer: git-send-email 2.53.0
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

When Rx hardware timestamping is enabled on 82580 and later parts, the
NIC timestamps every received packet in-band: it writes a 16 byte
timestamp header in front of the frame and sets E1000_RXDADV_STAT_TSIP
in the Rx descriptor.

Since commit 5379260852b0 ("igb: Fix XDP with PTP enabled"),
igb_clean_rx_irq() checks TSIP and calls igb_ptp_rx_pktstamp() for every
Rx buffer, including the continuation buffers of a frame that spans
several descriptors (jumbo frames, e.g. MTU 9000 with 3072 byte
buffers). igb_ptp_rx_pktstamp() is meant for the first buffer only; its
only validity check is that the first 8 bytes are zero. When a
continuation buffer happens to start with 8 zero bytes, 16 bytes of
packet data are treated as a timestamp header and removed from the
frame. ip_rcv_core() then drops the packet because skb->len is smaller
than the IP total length (IpExtInTruncatedPkts).

The drop depends on the payload, so retransmissions of the same data are
dropped as well. We hit this with GigE Vision cameras streaming 9000 byte
UDP packets to an I210 with ptp4l running: about one 4K frame in 700 lost
one packet; every original and every resend counted in
IpExtInTruncatedPkts, and a capture on the interface showed those
packets exactly 16 bytes short (8994 instead of 9010 bytes). With Rx
hardware timestamping disabled, or with packets small enough to fit one
Rx buffer, no packet was lost.

Only pull the timestamp header while no skb has been started for the
frame, i.e. from its first buffer, as before the commit above.

Fixes: 5379260852b0 ("igb: Fix XDP with PTP enabled")
Signed-off-by: Cyriel Ladriere <cyriel.ladriere@gmail.com>
---
 drivers/net/ethernet/intel/igb/igb_main.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
index 131df3e09ba1..24be1f37cc6a 100644
--- a/drivers/net/ethernet/intel/igb/igb_main.c
+++ b/drivers/net/ethernet/intel/igb/igb_main.c
@@ -9068,8 +9068,12 @@ static int igb_clean_rx_irq(struct igb_q_vector *q_vector, const int budget)
 		rx_buffer = igb_get_rx_buffer(rx_ring, size, &rx_buf_pgcnt);
 		pktbuf = page_address(rx_buffer->page) + rx_buffer->page_offset;
 
-		/* pull rx packet timestamp if available and valid */
-		if (igb_test_staterr(rx_desc, E1000_RXDADV_STAT_TSIP)) {
+		/* pull rx packet timestamp if available and valid; the
+		 * timestamp header is only present in the first buffer of a
+		 * frame, a continuation buffer (skb already started) holds
+		 * packet data that must not be stripped
+		 */
+		if (!skb && igb_test_staterr(rx_desc, E1000_RXDADV_STAT_TSIP)) {
 			int ts_hdr_len;
 
 			ts_hdr_len = igb_ptp_rx_pktstamp(rx_ring->q_vector,
-- 
2.53.0

