Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.14.198.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606356;
	b=cXkrC5ekcNPCgJMmXNWCzZxgzKMIjgWjMeBt7CuhfuNCTL50vKTeVjA2RfTj9zTkaSYO
	 HJr7Zg/s+6eUwK/PWjT+QbX56pFnTMPcBwsLrxS4EOlKdC5u+HcfrQkxK4WaJH0OaTEGI
	 v5XlNBAd122jYkrwUV+FcTBcHAloNaIhTggi3XMJKOhwqGiOpO3fsnJqNYDHSHl/ncYqT
	 flK1gR9wthNfP3KR0NcF8V/0BhyXENFGFRnTO3ES3B/c1CYzYGo2AtuIAL3TXnHg1Z5KZ
	 /PTaKIWRxuw0jv+6YMPwQJ1GWip2zuoYVp6sBnWjhQvHyAhHn2X2zk0APGWaBu4fXPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606356;
	h=DMARC-Filter:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:Received:DKIM-Signature;
	bh=tngRTRsDkGsMEgYa6vNFyHpS5ZDOVnlToz3MASXewnU=;
	b=VHzIH5sameYl66P8Nd2pUp0ltyupM+TiMKmc3REIoSebjszgmZuJIJCuDvSPdKQj/kqt
	 hH16JVcUxqd/wx4TwA8wd04pTCE2UYJFAkZiKboOnFe7Keux3usHkI5bSq9HZuhG7o0lz
	 UlZ3BffI7c935lAWBlhx1d3suLrvXsMt1M2rITh4y4fjk3SP8bR7uhhLEGyJoa+5OBU+S
	 YIOgokmENyQjPJ1ughgLld7vOI0SVnxfQA7pJgGlEKeftCJX0nhOlzPBDZxoJp25E375H
	 4pXRGity4HPMonADoa8/XCBxWEpkxjgbCg0okTpz5gZwGE2eMmg+J29JaHSTrv/7hLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rimpianto.com;
	spf=pass smtp.mailfrom=rimpianto.com;
	dkim=pass header.d=rimpianto.com header.i=@rimpianto.com header.a=rsa-sha256 header.s=s20260314391 header.b=fUAlx6Qz;
	arc=none smtp.remote-ip=46.14.198.178
Received: from mail.rimpianto.com (mail.rimpianto.com [46.14.198.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F754606A323;
	Wed, 25 Nov 2026 11:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F754606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rimpianto.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rimpianto.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rimpianto.com header.i=@rimpianto.com header.a=rsa-sha256 header.s=s20260314391 header.b=fUAlx6Qz
Authentication-Results: mail.rimpianto.com;
	auth=pass (plain)
From: Federico Musto <federico@rimpianto.com>
To: Chris Snook <chris.snook@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Federico Musto <federico@rimpianto.com>
Subject: [PATCH net v5 0/2] net: atl1c: fix the RX buffer leak on errored frames
Date: Wed, 25 Nov 2026 12:31:18 +0100
Message-ID: <20261125113120.99743-1-federico@rimpianto.com>
X-Mailer: git-send-email 2.54.0
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
Received: from localhost (Unknown [127.0.0.1])
	by mail.rimpianto.com (Haraka) with ESMTPSA id 455A4CB8-EA41-4A84-AB6F-0475A2A7EF25.1
	envelope-from <federico@rimpianto.com>
	tls TLS_AES_256_GCM_SHA384 (authenticated bits=0);
	Wed, 25 Nov 2026 12:31:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rimpianto.com;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From; q=dns/txt; s=s20260314391; t=1795606281;
 bh=tngRTRsDkGsMEgYa6vNFyHpS5ZDOVnlToz3MASXewnU=;
 b=fUAlx6Qz9BzL/ovxg+KUh1j3LVcLjyLpNXZem2KrWjoE7OhxorHZzprvpxTfle+gbuvRNcn3R
 CEUIzcl+Ywhle8bdBLhlrDxRiacnRONwgQpyuImsi6PUNNbyQ6h1GCrjCgTnr9z8drducvoofvv
 ijQ71L+qfwZyUpJ1OD3FLckxeE04u6KjdYn0cKEv6PfplqGVuyYp0uOi6R3xzE8RIEqRxXhKqra
 86l6zf2bxbqdvsAVIzAPRTV3dpfEvZgmM2CnKfuRUts16PDdGCifrJFLo/rXvcs9fyHpl84g+Ld
 wWaS6X0bGKmR2wWXJv1Bvvq9XyVtqv2SfFSCW8zjlB3Q==

Patch 2 is v5 of the fix for the skb and the DMA mapping leaked by every
RX frame whose descriptor reports an error. Patch 1 closes the race
between the RX poll and the ring reset of the link-down path.

v5 addresses the Sashiko AI review of v4:

 - 1/2 no longer proceeds with the ring reset when it stops waiting
   because __AT_DOWN appeared: a concurrent close/down/suspend resets the
   rings itself after napi_disable(), so the work item now leaves them
   alone. The wait is also bounded (~0.5-1 s, then the reset is skipped
   with a ratelimited warning), so a threaded busy-poll cannot stall the
   work item with interrupts masked. The wait only runs on the work-item
   path; atl1c_up() reaches the handler before napi_enable() and skips
   it. The carrier-off store is now ordered before the NAPI_STATE_SCHED
   sampling with an explicit smp_mb(): the handshake is a store-buffer
   pattern and the scheduling side is ordered by the cmpxchg in
   napi_schedule_prep().
 - 2/2 adds a dma_rmb() between the valid-bit test on word3 and the rest
   of the descriptor. word0 now decides whether a reset is scheduled and
   the ring is zeroed after a reset, so without the barrier a stale word0
   could schedule a spurious reset on weakly ordered CPUs.

The per-patch changelogs are below the "---" of each patch.

Both problems were found by code inspection. Build-tested with W=1 and
sparse on netdev/net: no new warnings.

Runtime-tested on a MikroTik CCR2004-1G-2XS-PCIe, which exposes emulated
AR8151 functions, with these two patches ported onto the driver of a
7.0.14-29-pve kernel plus diagnostic counters.  27 link-down events were
handled and the link recovered every time: 9 from the first campaign (3
PHY link flaps and 6 link drops that this card produces about 1.3 s
after an MTU change), and 18 from later flap campaigns, partly under
sustained RX load.  The load caught an RX poll in flight four times:
the wait loop iterated, the poll finished within a few milliseconds and
the reset proceeded normally.  The __AT_DOWN skip, the timeout branch,
the out-of-sync reset and the error path of patch 2 have not been
exercised on hardware.  No RRD out-of-sync events across ~4.3 GiB of
traffic plus the load campaigns, no Oops, no warnings.

One observation, reported for completeness: twice, about 1.3 s after an
MTU change and immediately before the device signalled link down, the
IOMMU blocked a DMA read from the device to an unmapped address.  Both
faults precede the link-down interrupt, so before the work item touched
by this series ran.  I have not established the cause; this card is
known to issue stale DMA around that event.

v4: https://lore.kernel.org/netdev/20261117225521.19689-1-federico@rimpianto.com/
v3: https://lore.kernel.org/netdev/20261103225218.19206-1-federico@rimpianto.com/
v2: https://lore.kernel.org/netdev/20261102215253.68185-1-federico@rimpianto.com/
v1: https://lore.kernel.org/netdev/20261027115156.17128-1-federico@rimpianto.com/

Federico Musto (2):
  net: atl1c: wait for in-flight RX polls before the link-down ring
    reset
  net: atl1c: free the RX buffer when the descriptor reports an error

 .../net/ethernet/atheros/atl1c/atl1c_main.c   | 169 +++++++++++++-----
 1 file changed, 121 insertions(+), 48 deletions(-)

-- 
2.54.0 (Apple Git-157)

