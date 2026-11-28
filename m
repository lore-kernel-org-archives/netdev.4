Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=89.147.111.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795854861;
	b=qTJb6PAjRzr7WSO0ftHIzJq9Naq+tYWnw80LFsVgHxIHGqX7Ixo0uWvBdEtdRvJouU1i
	 kcTmwzzYwjNLi85Z0THvmKX6i9gDa1UefxbUuL1L+rotWHQ1KSU0gWCXy72B8d+qI9vs7
	 sQQ6u3u/0ioYEpfoxMkwmkkLESx0Pr+ljsBfsTtSoDOibcKy5v95yhcugHYc2DejZNaIJ
	 MJ8HhDFS/BKKrgZrBqh29XwIQmG6alau8fR5H4mwfKrDQmvg0RIgwUSvzI99c0WB5Mr7Q
	 pdSgttwpGeJ9o9GsteFHM5ufiFGh7lMKGPfIcH6QcV61t+/bIn08/e3z2Mp5o108rFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854861;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sC0u+Ypx4dW4BDufXD8QEGkBrDgreDlR4Dt/7XSyxFU=;
	b=CxGAyOKuWMNeV+cYGFCiq8QeQ0QUTLiBcgbeZTTkTDQst0YdArz1nrjuVWhEJJb+WsLq
	 O3ij6hLZ6h+Yq+R6PHrUfH75YJKNgioQVocvV1G2bvWo0B+mPiP6IiFH1zFU1hB3IaKeT
	 +DJDVaamHe11ul5wNF0ljeDSLHqkS5LFT89loJaHoz8L6l+ZSqr4k2+Lj9JX7b6Q/ngOr
	 YP01vejmFscEiw38jXQJkf/xw8GbafWgR8geylhkRjTtfkt+q5+xwckeZS6nVkSofJ2HK
	 H+j+7KFEmO7yFBZEd+yUjdzCn2TNlI34xGlz/44GTdUE0F4dRldJH/ZjRXPUKE9mNaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fiftyone-percent.net;
	spf=pass smtp.mailfrom=fiftyone-percent.net;
	arc=none smtp.remote-ip=89.147.111.13
Received: from mx1.markusglobal.com (mx1.markusglobal.com [89.147.111.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7FA606A31C
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7FA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fiftyone-percent.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fiftyone-percent.net
Received: from mx1.markusglobal.com (localhost [127.0.0.1])
	by mx1.markusglobal.com (Postfix) with ESMTP id 4jc3VF2dgbzCs06
	for <netdev@vger.kernel.org>; Sat, 28 Nov 2026 08:34:13 +0000 (UTC)
X-Virus-Scanned: Debian amavis at mx1.markusglobal.com
Received: from mx1.markusglobal.com ([127.0.0.1])
 by mx1.markusglobal.com (mx1.markusglobal.com [127.0.0.1]) (amavis, port 10026)
 with ESMTP id bpS5cw_qqZ_E for <netdev@vger.kernel.org>;
 Sat, 28 Nov 2026 08:34:13 +0000 (UTC)
Received: from [10.132.52.115] (unknown [150.228.243.38])
	by mx1.markusglobal.com (Postfix) with ESMTPSA id 4jc3V520ZzzCrhR;
	Sat, 28 Nov 2026 08:34:04 +0000 (UTC)
Message-ID: <17e86b6f-25af-43fc-b0ca-a0eb982e6cf4@fiftyone-percent.net>
Date: Sat, 28 Nov 2026 19:34:01 +1100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 1/3] net: ethernet: mtk_eth_soc: fix the RX
To: Sandeep Haemoon <sandeeph@loljews.com>, netdev@vger.kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Russell King <linux@armlinux.org.uk>, Daniel Golle <daniel@makrotopia.org>,
 Mason Chang <mason-cw.chang@mediatek.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
Content-Language: en-US
From: Eugene Markus <eugene@fiftyone-percent.net>
In-Reply-To: <patch-295a65477d87017ff5b65482ffae46fb@loljews.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On Sat, 14 Nov 2026 00:34:14 +0200, Sandeep Haemoon wrote:
 > Reset dma_addr to DMA_MAPPING_ERROR at the start of every iteration,
 > so a descriptor that is released without a new mapping keeps its own
 > address bits.

This bug is not theoretical: it has been corrupting memory in the field
on a BPI-R4 Pro 8X (MT7988A, 8 GiB) running OpenWrt main (r38441,
kernel 6.18.60) as a home router with a Bitcoin node behind it. We
arrived at the same one-line fix independently before finding this
series, and have tested it on that board.

You wrote on 22 Nov that the issue fixed in 1/3 came from automated
review and had not been triggered at runtime. On this board it is
triggered, through the refill allocation failure path, as below.

Symptoms, five times, between 8 minutes and 2 h 47 min into a sync with
the node's peers on the WAN port (the GMAC's own port, not DSA):
  - "BUG: Bad page map" in the node's process, then "Unable to handle
    kernel paging request" in unmap_page_range() and a panic;
  - "get_swap_device: Bad swap file entry" with no swap configured;
  - LevelDB "block checksum mismatch" on files intact on disk.
The corrupted pages held a received WAN frame starting at byte 256
(MTK_PP_HEADROOM): a page-table page had the board's WAN MAC followed by
the gateway's MAC at entry 32, and a LevelDB page in the page cache held
a complete IPv4/TCP frame from a peer's port 8333. The trigger is a
page_pool allocation failure: the page cache fills the 8 GiB and free
memory sat at 60-120 MB.

Bench test, RAM-booted kernel with PAGE_TABLE_CHECK, DEBUG_PAGEALLOC
and KFENCE; a test-only switch making every Nth RX refill fail (standing
in for a page_pool failure) and another restoring the old dma_addr
handling; a user process holding 6000 MB with a known pattern that
reports every changed page with its physical address (pagemap); TCP
into the GMAC at line rate:

   dma_addr handling   refills released with   pages changed
                       another buffer's bits
   old, run 1          166                     70, each a WAN frame
                                               at byte 256
   old, run 2          11                      4, each at exactly the
                                               address the driver
                                               computed (e.g. frame to
                                               0x1613cf100, page
                                               0x1613cf000 changed in
                                               bytes 256..1775)
   this patch          0 (59,817 and 45,274    0
                       would have been)

The other misdirected frames pointed below 0x40000000, where this SoC
has no RAM but has device registers and PCIe windows. No kernel errors
were logged in any phase: the debug options cannot see a device write.

On the board itself, the node then synced 57,736 blocks (about 6 hours
of continuous peer traffic) with this patch and no corruption; the build
before it, without the patch, corrupted after 2 h 47 min.

As this is silent memory corruption with network-supplied contents on
shipping MT7988 boards with more than 4 GiB, could 1/3 go to net on its
own, with Cc: stable, ahead of the jumbo frame work?

The analysis of the corrupted pages, the driver reading and the bench
tests were done with an AI coding assistant (Claude Code); I ran them on
my board and have checked the results.

Tested-by: Eugene Markus <eugene@fiftyone-percent.net>
