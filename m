Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795146756;
	b=UJV4wjEhx0zd5FCR57EbEE4oWJkpmkFI9sdbIsdVjWwevDQ1sjkpSMgizNVjQfHbXZTp
	 VStKtveXlj2tYFnUEZ820MNKso4ENT/C6LZIEJAtEkRMLRPR1JCqD14o19TGu+FhqoiLj
	 PJmALUqxUTyi+OKsSJYtuH0pf1eYiXOy9Xhc60yf67uEJJ7dZRP44byOwODRP6maWlGSG
	 JISvFJqIBpt9/Ti8rFDLTj8g7IoX2reo8i+bRIkZwF+cKgPFmN4YNSzIEQEYbDtckvaON
	 w5hJIH922/TTwqAQmMq8yhzmevsROLGoBszGdMOS7qUjm1mur/FO5udSr/fFoTNdGXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795146756;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lwP4Uhx3OX3XMSX6To6cKm0zQhWLlLA6x1kPYJ38K2Q=;
	b=Uj5mHlhq4lhIs28rcKIHU27NnuaiTd2/koSfSCx4pPGa1/htJguyX6MqS0NZQvvM1Vwo
	 hJpsZIQvhel0ZOhyJOjc12S+CbNP0sZSjmfmDzVIDW4tAhcs0//+K6I7RzxYUwnZBgj3f
	 Z7j4QxB8g90GC8EWI6AK9XqQMF9TQV6+uo0mOEH7rb5PSZH/XRvAl911U12ZBfs67anRp
	 byPR5jJxKJFnP5om0MtgS5O2pi6gqv5hIMLv5n1bAFlXX3Ft4ng3Emyd/IvNwxMuNRxLs
	 XCIVn2tEou2QQpnSgyRPsv1R1lZu5n+2GVPkmZTnT3/mx4f3vXTVsFPCoCPNcHLie4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lP6GDl6w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3E0606A320
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 03:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lP6GDl6w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2CEE1F000C6;
	Fri, 20 Nov 2026 03:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795146756;
	bh=lwP4Uhx3OX3XMSX6To6cKm0zQhWLlLA6x1kPYJ38K2Q=;
	h=From:To:Cc:Subject:Date;
	b=lP6GDl6wE9xvrZEZdvXuRVX4ol60dcOK/7NHZLOLxPk9jz5mfn88ku1y+RubBVUut
	 m7z/4mIBYLSQSJogwXTnMxau4eyXMiCGs+6YbVwV5zxevzOw7E4bsSUKlGyGt2U+V1
	 xj9jhuYunb+/GOEIDArwKHgu0o9mRYo4w1mDl/wBqo6rap4wCPfnwyaeGUocrj30M/
	 MoOE/+HPfFlYF5W/WvlkjTmeSV8TnBaQbHZr4iv3cqEO0i2VzejSGVnYqejhqI/TsD
	 7WTBgHFScQ0Qg1WBSRcIFU75x2UQFidb1to8Q3rNGN94m4xbtE8D3iRSFVbUG3A7fJ
	 YdYucd8TmfzNQ==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	bjorn@kernel.org,
	joe@dama.to,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next v2 0/7] eth: bnxt_en: allocate memory on the right NUMA node
Date: Thu, 19 Nov 2026 19:52:07 -0800
Message-ID: <20261120035214.369158-1-kuba@kernel.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Teach bnxt to allocate the memory touched by the fast path
on the NUMA node where NAPI is being serviced.

On modern systems the PCIe controller is part of the CPU.
On NUMA systems we get to pick which NUMA node the queue and NAPI
related memory will get allocated from. Allocating SW state on
the node where NAPI will run is just common sense.
For memory touched by both device and the CPU we need to pick
which side will pay the extra price (either device or CPU
will have to "reach" futher). This series allocates all state
and all descriptor rings on the NAPI CPU.

Testing a dual-IO-die AMD Venice CPU, where NIC is on node 1
and with NAPI+kperf pinned to node 0, this series gives:
 placing page pools on the right node:    -5.1% CPU load
 placing page pools and completion rings: -8.9% CPU load

Moving SW state is in the noise in a tight-loop kperf banchmark
as the state fits in the cache, anyway.

This series was the motivation for cleaning up the DMA API
allocations with explicit NUMA node:
commit a0aa9ceca03f ("Merge tag 'dma_alloc_coherent_node' of git://git.kernel.org/pub/scm/linux/kernel/git/kuba/linux")

I held off reallocating the Rx completion ring on queue restart,
we need to fix the IRQ coalescing there first:
https://lore.kernel.org/all/20261120034645.364630-1-kuba@kernel.org/

v2:
  - convert the sp_event producers which set the bit directly (Björn)
  - correct the comment on ring_nid, it's not only written by the notifier
  - allocate ring_nid with kmalloc_objs()
  - add a prep patch with a local bp variable in the IRQ affinity notifier
  - split the TPH condition in the IRQ affinity notifier (Joe)
  - only compare the node of queues with explicitly set IRQ affinity
v1: https://lore.kernel.org/20261118023905.3050661-1-kuba@kernel.org

Jakub Kicinski (7):
  eth: bnxt_en: order event data before setting the sp_event bit
  eth: bnxt_en: follow explicitly set IRQ affinity when placing page
    pool
  eth: bnxt_en: allocate per-queue SW state on the queue's NUMA node
  eth: bnxt_en: explicitly keep device-only memory on the device's node
  eth: bnxt_en: allocate fast path DMA rings on the queue's NUMA node
  eth: bnxt_en: add a local bp variable in the IRQ affinity notifier
  eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA
    node

 drivers/net/ethernet/broadcom/bnxt/bnxt.h |   7 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 250 ++++++++++++++--------
 2 files changed, 169 insertions(+), 88 deletions(-)

-- 
2.56.1

