Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=12.32.117.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794926732;
	b=a4ZfYI7CXhMKSHHefbA2SmFwUzLhqD3gR4N3JtRMp1uFRIzj/w1Llt9o/dlxAMVZY2a4
	 CKg/g+FXkiHvgQZzPif60aREqae1afH3wH2+ZRcUtuSx+sxFBvblszEwjbo1G8nlolqeG
	 0d10uaKjGM4DZeEXP7N+Zy83A1GbLBd0MZHEitFDewa4eUPJuNCeMcyaw+IhL9l103Ap/
	 LLqn2uPDRH8keAYm1JJyb4FvJ1R8V3VDgTJULcBH1lUJi6zCXfZogTOM29Od7ueiBbXMs
	 /0jIuzQNKAy4Ny0PHkPd4DxgD5OkNxqvhxmWhWwqTP6u80RBf+MAKit+yOJvdq+O9bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794926732;
	h=DMARC-Filter:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NQlvSZfMXJHll3vKapvCEus7v8S4RkfYXh8ZBJWOLow=;
	b=QmzgGAXLEsidO+hr733MUv6GPWI25ty9rNa32C4lrxqKrSKkYJ71hvZKzzlYSaRD2Eoa
	 MK5CE6DvWf4PkIGG0JD1GqYd5mNpHgZDzqgFFJOvFU9cI4LGNjFJLHVMpgeob9OuKxTpv
	 UZk8sebQlJig/vMspQcivSpjeS698K+jELu31MLmth6ngMkryiUwgNuqhPK4Hp6mAOpH0
	 HmGszh3lcpn5oEtMRJk1M1pMyaFOpzAYKida4PCKBZ+ac4Yh2d50daRgKPdM7HyY8TRDY
	 tkdx6T21u9xSg1U+AgkqHgeSxwDymnFq4ataQgwRzhKqbwoUNW44WBJWxKkanGcPtvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chelsio.com;
	spf=pass smtp.mailfrom=chelsio.com;
	arc=none smtp.remote-ip=12.32.117.8
Received: from stargate.chelsio.com (unknown [12.32.117.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABB5606A331
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 14:45:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABB5606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=chelsio.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chelsio.com
Received: from localhost ([10.193.191.19])
	by stargate.chelsio.com (8.14.7/8.14.7) with ESMTP id 6AHEjDRq013393;
	Tue, 17 Nov 2026 06:45:13 -0800
Date: Tue, 17 Nov 2026 20:15:07 +0530
From: Potnuri Bharat Teja <bharat@chelsio.com>
To: Simon Horman <horms@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "kuba@kernel.org" <kuba@kernel.org>,
        "edumazet@google.com" <edumazet@google.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
        "Harshita V. Rajput" <harshitha.vr@chelsio.com>
Subject: Re: [PATCH net-next v5 REPOST 03/12] cxgb4: add T7 hardware
 management support
Message-ID: <avxoc4fRV6sxEuh/@chelsio.com>
References: <20261105131549.547554-1-bharat@chelsio.com>
 <20261105131549.547554-4-bharat@chelsio.com>
 <20261111155034.GF18859@horms.kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261111155034.GF18859@horms.kernel.org>

On Wednesday, November 11/11/26, 2026 at 21:20:34 +0530, Simon Horman wrote:
> On Thu, Nov 05, 2026 at 08:15:40AM -0500, Potnuri Bharat Teja wrote:
> > Extend the cxgb4 hardware management layer to support T7 adapters.
> > 
> > Add T7 handling to hardware resource and topology discovery.  The TP
> > load balancer mode and the firmware supplied TP channel map are read
> > into adapter_params, and t4_get_mps_bg_map() and t4_get_tp_ch_map()
> > account for the T7 channel layout.  The load balancer mode distributes
> > the four TP channels across the active ports as four ports of one
> > channel, two ports of two channels, or one port of four channels.
> > 
> > t4_get_chip_type() moves from cxgb4_main.c into t4_hw.c so that chip
> > identification lives with the rest of the hardware layer, and learns
> > the T7 chip version.
> > 
> > Add T7 flash support.  The flash layout is described by a table
> > indexed by flash location rather than by fixed FLASH_*_START_SEC and
> > FLASH_*_NSECS constants, with t4_flash_location_start_sec(),
> > t4_flash_location_nsecs(), t4_flash_location_start() and
> > t4_flash_location_size() returning the bounds of a region.
> > t4_flash_cfg_addr() now returns int so that it can report a region
> > that does not exist on the running adapter.  t4_get_flash_params()
> > learns the flash parts used on T7 and a four byte address serial
> > flash interface, which is required for parts larger than 16MB.
> > 
> > Add the T7 register ranges to t4_get_regs(), the T7 PCIE memory window
> > registers, and T7 support to the CIM ingress and egress queue, CIM LA,
> > SGE context, MPS trace filter, PM statistics, scheduler and I2C
> > accessors.
> > 
> > T7 implements multiple uP cores.  The number of enabled cores is read
> > during device log initialisation and the per core device log
> > parameters are kept in an array, so that the device log and the CIM
> > queue accessors can address a specific core.
> > 
> > Signed-off-by: Potnuri Bharat Teja <bharat@chelsio.com>
> > ---
> >  .../net/ethernet/chelsio/cxgb4/cudbg_lib.c    |    4 +-
> >  drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |   89 +-
> >  .../ethernet/chelsio/cxgb4/cxgb4_debugfs.c    |    2 +-
> >  .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |   17 -
> >  drivers/net/ethernet/chelsio/cxgb4/t4_hw.c    | 2200 ++++++++++++++---
> >  drivers/net/ethernet/chelsio/cxgb4/t4_hw.h    |  139 +-
> 
> Hi Potnuri,
> 
> I've looked over the first three patches of this series, with the help
> of AI, and I'd like to provide some general feedback:
> 
> * These patches, and the overall patchset are very long.
>   I would really suggest splitting up these patches.
>   And I think that means also splitting up the patch-set,
>   into stages.
> 
Hi Simon,
Thanks for your detailed response and time.
I had to leave these first 2 patches huge as they are adding new HW register/structures. 
and they may be remain reltively huge even after splitting them. I may need your suggestion here. 

The rest of the patches are relatively small and I am working on splitting the rest of the patches 
to smaller ones where all possible.
>   I know that sounds like it's going to take longer.
>   But experience tells me that getting review of large
>   patchsets to the extent that a merge occurs tends
>   to be a very long road.
> 
> * Being long, these patches do many things.
>   But the preferred approach is one thing per patch.
>   This is much easier on my human brain.
>   And I don't believe I am alone here.

agree with you, however these changes are interdependent so not sure if they can be split into series.
> 
> * It seems to be a bit of a stretch for patches 1/12 and 2/12 to
>   claim there are no functional changes. And to be honest,
>   they are two long for me to dive into the details.
> 
1 and 2 only contain device specific definitions
> And, some specific feedback on this patch:
> 
> * It appears to introduce new kdoc warnings. Which I believe
>   are gating part of our CI. This is not desirable.
> 
Shall fix these and validate with kernel-doc prior to posing the next series.
Thanks.

> Warnings before: 262 after: 276 (add: 20 del: 6)
> 
> Warnings removed:
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:12909 No description found for return value of 't4_read_cim_ibq'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:12951 No description found for return value of 't4_read_cim_obq'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:13550 No description found for return value of 't4_i2c_rd'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:12909 No description found for return value of 't4_read_cim_ibq'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:12951 No description found for return value of 't4_read_cim_obq'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:13550 No description found for return value of 't4_i2c_rd'
> Per-file breakdown:
>      6 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
> 
> New warnings added:
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9269 No description found for return value of 't7_wait_sram_done'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:10396 No description found for return value of 't4_get_tp_port_chan'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:13332 No description found for return value of 't4_get_chip_type'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:13641 No description found for return value of 't4_sge_get_qpp'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14243 No description found for return value of 't4_read_cim_ibq_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14319 No description found for return value of 't4_read_cim_obq_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14373 No description found for return value of 't4_cim_read_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14429 No description found for return value of 't4_cim_write_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14484 No description found for return value of 't4_cim_read_la_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:15019 No description found for return value of 't4_i2c_io'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:9269 No description found for return value of 't7_wait_sram_done'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:10396 No description found for return value of 't4_get_tp_port_chan'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:13332 No description found for return value of 't4_get_chip_type'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:13641 No description found for return value of 't4_sge_get_qpp'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14243 No description found for return value of 't4_read_cim_ibq_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14319 No description found for return value of 't4_read_cim_obq_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14373 No description found for return value of 't4_cim_read_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14429 No description found for return value of 't4_cim_write_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:14484 No description found for return value of 't4_cim_read_la_core'
> Warning: drivers/net/ethernet/chelsio/cxgb4/t4_hw.c:15019 No description found for return value of 't4_i2c_io'
> Per-file breakdown:
>     20 drivers/net/ethernet/chelsio/cxgb4/t4_hw.c
> 
> -- 
> pw-bot: changes-requested
> 
> 
