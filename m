Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794969549;
	b=EWOWIvbO5+LIr6rn+85VNvXcZMY+SCbIgt3uhJFHsupV0lZFyCYU+W38uMWjljs1RuoW
	 GbrKM1M9mWxwBdHlYMeOUDfEjs3zQREXNSVjNCGEoYp0F8L7C9zOMGZYBbr5QQABQyAs+
	 DjsPDOnWTq6arSnwnsm82FwK0a0ptURuuVxBqOd3Cz3WoT6+chJia8TBqEYhh3sqSX8EE
	 LDOLiI844ewT2tYJmUIFreiAaeIONL/tuZpTxeHsMR3zSHoXWH1G5meCEiqTDycqtH+tj
	 njNGKjbgLdHWlyDxOy4yo2KbDNsrFOD0ZTLZ9kieiwLzInSLA8l/L3SL7kt1dChaTcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794969549;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4IefxGOVrie2q+3W2+0E+ydSIc1o5UmUe+FYzMqsbm8=;
	b=x6SoK+BJ9BMeOVfw5D9e4q2vwfLZGLeMex1Ib2OLiw509ZhEm8Xl/pfcwMjGznoBQd8W
	 Fhuvsy+JxuTbBEGEAIxQ/inlZK9H1v1BXCiNTiZjglt5d/ydCU5wt/Au3pX/f9Eu5eK8U
	 XAfUEUSZ9uRtpuKoLBGVyMCUQSxvGd9A0VBV844WrvNSYgiUuOhf+wlXLCJaeXctGrc0o
	 GcmMvnSzF4M180imvAZo/aeSdYdVHcfO0hL8EA09USFD4L8dC5IXJ+Hmj7z3qgefP107r
	 lL6lJXiQw0BhqvrhimHg/DoTzW9xZChALqTQpMzE+aZgtam4NycytLYKlWNTGZFl5NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HuYuqztX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD06B606A325
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 02:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HuYuqztX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691341F000C4;
	Wed, 18 Nov 2026 02:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794969549;
	bh=4IefxGOVrie2q+3W2+0E+ydSIc1o5UmUe+FYzMqsbm8=;
	h=From:To:Cc:Subject:Date;
	b=HuYuqztX/8xSJfBoq2Z533CU0sn1fZ2FCbCEpo4Jdv72wl1p4C67SZgOvGsY5DXXL
	 Xa8/Xd/X65NxkZjfSazKlJOpuHCF+PjrI1CXEiVQvuCh6uqimYgobzCYjpMVq7Wtxm
	 Agwg3mCHAgEZDPdNN1+s/dL4Kabjtg+p6iK9FVHQ51ge2xfNkfL9afRhi1Z48r0KbS
	 BVoVBoxbn7eQuudS7Nv7YSC2AlEkoZXuxvNkSancDPW2S/YDdmT4reG1R3j0vxvwIE
	 7wOAP8ZlZ1KiX6j/5YThQWqOOwcXVUAF1KNH8tHJD+nefJW7j1GWP42I0PUA/q/RQp
	 FIicZzFM+Y4iw==
From: Jakub Kicinski <kuba@kernel.org>
To: davem@davemloft.net,
	michael.chan@broadcom.com
Cc: netdev@vger.kernel.org,
	edumazet@google.com,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	pavan.chebbi@broadcom.com,
	Jakub Kicinski <kuba@kernel.org>
Subject: [PATCH net-next 0/6] eth: bnxt_en: allocate memory on the right NUMA node
Date: Tue, 17 Nov 2026 18:38:59 -0800
Message-ID: <20261118023905.3050661-1-kuba@kernel.org>
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

Jakub Kicinski (6):
  eth: bnxt_en: order event data before setting the sp_event bit
  eth: bnxt_en: follow explicitly set IRQ affinity when placing page
    pool
  eth: bnxt_en: allocate per-queue SW state on the queue's NUMA node
  eth: bnxt_en: explicitly keep device-only memory on the device's node
  eth: bnxt_en: allocate fast path DMA rings on the queue's NUMA node
  eth: bnxt_en: restart Rx queues when their IRQ moves to another NUMA
    node

 drivers/net/ethernet/broadcom/bnxt/bnxt.h |   7 +-
 drivers/net/ethernet/broadcom/bnxt/bnxt.c | 203 ++++++++++++++--------
 2 files changed, 141 insertions(+), 69 deletions(-)

-- 
2.56.1

