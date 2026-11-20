Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795195771;
	b=et4WVd4ioeqxufugxaXrEEnyOEVPzMbG3QO2qPCDx2OHi7fWpVA2XMwRLbtKJCINEs/F
	 PBZPtmLszo1Eja0vJP2CG/8K2f1gESUVh0+eHQt5v253IGNg0S6SC9QosRgXpZJ2pi7Se
	 ey5gYpa/0MRshCvS/2RsyWFaon3M8/onWcXZ46ZZ1dsPZN13fc8ay3WNGU3VU1kd1wQYV
	 Q00m45I7PKP3sX55hvcmL60DjQnREvNSNk3c12yZSYlxxwS3VraiaXrO7cTl9DyzjziWi
	 Eq/P2n33t1B15iqzvIdWMVos3QbUHOEPAIEEqR48YGEP8reNCfDIXgigk6jV/BnZVWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795195771;
	h=Received:DKIM-Signature:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer;
	bh=7UDbp3q//rVh0dGbDdN8O2+BThn2ndA2A8utxcL2KqQ=;
	b=IjPXwJ16m1ZkKGvpcYpDn0skmnGOUu2yEeIsIHO5jiZBwEKfU93SAR2/DswzBXVMKr+f
	 mb22mpAR+EuCKVbarhIBM+1Y2U0TJCmynWm9/MBSpCO4zrPy/prFNzGsKikUbt11MIq+C
	 Ga4ioxrxMeEzRLMZZiO/Dz/K4rh56ZPM0vlUnlHkM/dSEHwnDgC5/UIgQRGr48py6RHjz
	 8xduc1KPagZcn63Qox2oOHquwjjdrQZSrL/YtCKiBCG4JNtwZFxu4tuyzx0NqjE9AEZam
	 GiY8qDi34OaG29tM7K66MVmtTUtCNTlZsPgryBoYWinAHDb8ajXke3vjuSy/HZXzApQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8Dcizox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4697606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 17:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M8Dcizox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A8E21F000E6;
	Fri, 20 Nov 2026 17:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795195770;
	bh=7UDbp3q//rVh0dGbDdN8O2+BThn2ndA2A8utxcL2KqQ=;
	h=From:Subject:Date:To:Cc;
	b=M8DcizoxyyYHJhr3Vl6Fr025X3WFMmFhkERQxEMduC/BpMe6UlpwlFukmzcHv2mAl
	 gFcVGhequ7Jw4xL/5KJuy0zm2sYQsxRzRk6b8py4I+3Haw8gt6HRDlbVH0EVpHJLbX
	 asv5j0A9zFsmZmxchCHYesJe4x4xCijnioMxfxh1rmd6gsDWAcJQ8/Ld46E8lWA9sh
	 0vvtfPNE6iiV2U9jI2Xn3cKGvWCXoWUAtQpsiji6+ycsosy/Ccm4ad1xt2U8XjaKo+
	 EQhXKrFJbLpQwufl6YLjg04FULwKqvb19/v+WPBbIAuXTgv9jy2nXjvLsSDnKbLUVZ
	 tNNfuZwdwxQbQ==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH net-next v9 00/14] net: ethernet: cortina: Fix Gemini RX
 buffer management
Date: Fri, 20 Nov 2026 18:29:19 +0100
Message-Id: <20261120-gemini-ethernet-fixes-3-v9-0-298671d799d5@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/33RyWrDMBAG4FcROmfKaBktPvU9Sg+yNUpEW6fYx
 qSEvHuJC62Lcc7z8812lSMPlUfZiKsceK5jPfeyEfEgZHdK/ZGhZtkIqVE7jCrCkT9qX4GnEw8
 9T1DqhUcwUNCicWSKNkkehPwceCnJRrzIe7DnyyRfD0Ke6jidh6+l5ayW+o+ucVefFSCYpBNhC
 iaH+Px2D7w/nYfjgs56DYV9SAOCp5B8pOyTDxvI/EIKUe9D5j4Rq6IpREy8hewKUmofsoBgW+W
 MajEUyhuI1hDtQwQILXWRdfFtSGYDuT9IodmHHCB0tqVSQnKUt6v5FaQefM0DQuyMTipZl7jbQ
 GENPTh2AIRC1GZrGHX+v9rtdvsGNmCmNsgCAAA=
X-Change-ID: 20260919-gemini-ethernet-fixes-3-f0403653f23a
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 =?utf-8?q?Micha=C5=82_Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>, 
 Myeonghun Pak <mhun512@gmail.com>, Eric Dumazet <edumazet@kernel.org>
Cc: netdev@vger.kernel.org, Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0

The Gemini ethernet uses a custom software free queue shared by both
ports. Its page metadata, DMA mappings and fragment references are not
managed consistently as pages move through the free queue and RX queues.

Correct the DMA address bookkeeping and synchronization.

Track exact fragment mappings with an XArray and keep
in-flight page metadata in bitmap-allocated slots until all hardware
references have been claimed.

Serialize queue resize against the refill interrupt, harden fragment
validation and teardown, then scale the default queue sizes for systems
with 32 or 64 MiB of RAM.

This series now stops at the RX queue memory sizing changes. Statistics,
RX coalescing timer lifetime and retained TX pointer handling are split
out into gemini-ethernet-fixes-4.

This series wasn't so complex to begin with but Sashiko and the other
LLMs just find more and more corner cases. It's for the better I
guess.

Before these patches the network driver would crash under strong load
but it does not happen any more after. Tested on the D-Link DIR-685
playing back media and transfering new media using ksmbd while
issuing ping storms.

Target this series at net-next. I will backport these changes to OpenWrt.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v9:
- Rebased on net-next.
- Drop all Fixes: tags.
- Move statistics and other follow-ups out of the series.
- Chop off patches to force the series down to 14 patches, save other concerns for later
- Link to v8: https://patch.msgid.link/20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org

Changes in v8:
- Protect TX fragment statistics updates during process-context teardown.
- Rebuild idle shared free queues on reopen to reclaim unclaimed fragments.
- Separate RX buffer capacity from retained-pointer descriptor ring sizing.
- Preserve PHY probe deferral and clean up fixed links on probe failure or removal.
- Link to v7: https://patch.msgid.link/20261110-gemini-ethernet-fixes-3-v7-0-9c32a1a46aec@kernel.org

Changes in v7:
- Bound free queue refill work and release surplus metadata on downsizing.
- Serialize TX completion statistics with the IRQ-side writers.
- Fix ethtool statistics retry bounds and counter synchronization.
- Reject pfmemalloc pages when recycling RX buffers.
- Document XArray dependency for lifetime and recycling backports.
- Reject TX rings smaller than retained hardware pointers, so now the
  series has also started to fix things on the TX path.
- Document the retained SWFQ pointer shrink and allocation limits.
- Keep ports IRQ-only after PHY setup or netdev registration failure.
- Keep parent-held port clocks enabled through IRQ draining and queue teardown.
- Link to v6: https://patch.msgid.link/20261103-gemini-ethernet-fixes-3-v6-0-c4b5ff8a65d8@kernel.org

Changes in v6:
- Initialize statistics synchronization objects for lockdep.
- Post free queue pages from the exact retained descriptor pointer.
- Document replacement-page lookup failures and tag the DMA mapping fix.
- Initialize and drain the RX coalescing timer around its IRQ lifetime.
- Rebased on v7.4-rc1
- Link to v5: https://patch.msgid.link/20261015-gemini-ethernet-fixes-3-v5-0-b5c9e2f7b8a3@kernel.org

Changes in v5:
- Preserve complete frames terminated by an empty EOF descriptor.
- Recheck concurrently retired pages before consuming fresh metadata slots.
- Fold RX ring metadata sizing and resize rollback into the page lifetime
  fix.
- Match free queue teardown unmaps to the saved full-page DMA mapping.
- Preserve the hardware-owned free queue read pointer across rebuilds and
  keep replacement rings large enough for its retained position.
- Keep shared initialization parent-owned, quiesce inherited IRQ state
  before child handlers register and force first queue setup from ring
  state.
- Link to v4: https://patch.msgid.link/20261011-gemini-ethernet-fixes-3-v4-0-4b1631b08f5d@kernel.org

Changes in v4:
- Protect stop-path RX statistics updates against preemption on 32-bit systems.
- Validate final RX lengths against the Ethernet minimum and descriptor
  transfer size so malformed chains cannot pass short skbs to GRO.
- Charge the full posted RX fragment size in skb truesize accounting.
- Reject free queue geometries that cannot post one complete page and
  document the changed refill and recycling behavior.
- Reset the free queue allocation cursor with its bitmap during teardown.
- Bound recycler IRQ latency and release retained mappings for stack-owned
  pages before allocating replacements.
- Rebuild oversized free queues while both ports are down so RX ring
  downsizing releases the surplus pages.
- Scope RX statistics writer sections to counter updates for PREEMPT_RT.
- Restrict shared free queue handling to port 1 so IRQ draining covers
  every registered handler path.
- Reset and mask free queue pointers when rebuilding the queue.
- Reorder the shared queue ownership fix before the port lifetime fix.
- Publish ports only after setup, serialize their lifetime with RTNL and
  suppress independent child unbind while port 1 owns the shared IRQ.
- Move child-unbind suppression and PHY teardown ordering into the
  parent-ownership patch.
- Link to v3: https://patch.msgid.link/20261002-gemini-ethernet-fixes-3-v3-0-3e1f25890ae8@kernel.org

Changes in v3:
- Add Fixes tags throughout the series, using the original driver commit
  where no more specific offending commit exists, and replace Resolves with
  Closes on the lifetime fix. I did not retarget the series to net
  because there are dependencies in net-next and we are getting closer
  to the merge window.
- Keep PHY-less port 1 bound as the shared free queue IRQ owner and clear
  stale parent port pointers.
- Disable the port 1 Linux IRQ throughout free queue resizing so no newly
  woken threaded handler can race queue teardown or setup.
- Keep failed queue rebuilds quiescent in the IRQ-drain patch.
- Serialize linear DMA lookups before converting them to an XArray.
- Keep all XArray mutation under the IRQ-safe free queue lock.
- Defer page unmapping until fragment lifetime is tracked, and fold DMA
  synchronization into that fix.
- Check free queue space before allocating and mapping a candidate page.
- Rebuild free queue metadata when RX rings grow and roll back rejected
  ring changes.
- Recycle released pages with explicit DMA synchronization using the
  existing free queue allocator.
- Account inconsistent RX descriptor lengths as drops rather than wire
  length errors.
- Count partial RX frames discarded during stop as dropped.
- Drop the cleanup guard conversion because it is not recommended for
  network drivers.
- Link to v2: https://patch.msgid.link/20260928-gemini-ethernet-fixes-3-v2-0-758a795d7a78@kernel.org

Changes in v2:
- Replace the page_pool conversion with several smaller fixes using the
  existing free queue page allocator.
- Split DMA bookkeeping, XArray lookup, bitmap allocation, cursor rotation,
  synchronization, validation and teardown into individual patches.
- Drain the threaded free queue interrupt before resizing the shared queue.
- Allocate and DMA-map refill pages outside the IRQ-disabled free queue
  lock.
- Reject and unwind partial initial free queue fills, reset their hardware
  pointers and leave the refill interrupt masked so setup can be retried.
- Avoid full-page CPU synchronization after fragments enter the network
  stack.
- Bound RX lengths to the posted fragment and account rejected lengths as
  receive errors.
- Keep the fixes, and keep the add-on RAM sizing patch.
- Link to v1: https://patch.msgid.link/20260920-gemini-ethernet-fixes-3-v1-0-3a2a50a83d89@kernel.org

---
Linus Walleij (14):
      net: ethernet: cortina: Keep shared free queue parent-owned
      net: ethernet: cortina: Keep ports bound for shared IRQ
      net: ethernet: cortina: Drain free queue IRQ before resize
      net: ethernet: cortina: Normalize free queue pointers on rebuild
      net: ethernet: cortina: Correct free queue DMA mappings
      net: ethernet: cortina: Index free queue fragments with XArray
      net: ethernet: cortina: Preserve in-flight free queue pages
      net: ethernet: cortina: Rotate free queue page allocation
      net: ethernet: cortina: Recycle claimed free queue pages
      net: ethernet: cortina: Separate RX buffer capacity from free queue size
      net: ethernet: cortina: Validate RX fragment lengths
      net: ethernet: cortina: Account RX buffer size in truesize
      net: ethernet: cortina: Release partial RX frames on stop
      net: ethernet: cortina: Scale Gemini RX queues to system memory

 drivers/net/ethernet/cortina/gemini.c | 923 +++++++++++++++++++++++++---------
 drivers/net/ethernet/cortina/gemini.h |   2 +-
 2 files changed, 699 insertions(+), 226 deletions(-)
---
base-commit: 2208ab00f4f213ade91ab775e7f8c4dacdcc856e
change-id: 20260919-gemini-ethernet-fixes-3-f0403653f23a

Best regards,
--  
Linus Walleij <linusw@kernel.org>

