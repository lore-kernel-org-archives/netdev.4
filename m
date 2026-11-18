Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=173.37.86.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795044767;
	b=rW3z8ktCOoajEwcLh7kBg/4nxsmRnGgSmvMuDhfMyv8o1sU/DZeM6yx6je5hDPkgD7zJ
	 3s0ZaziRAFJWksXmrfDBs63AA+sCXGtk6WsHGOagrweudbjrL05cDjYKLy/7KlIZVCSG0
	 eAWVyQfSPAz1On3esW6cVNn4fH+wURSFZ44oFEydKeylDkOzL9dyJ/hlNdvJLiacZlxaC
	 AuexPxcN5ZgHbjgbnQEvnjaKH3Q+WAjWwdLv8LjlO9RK7xUb+FQ2zj0g7DbWJiwJ0vDGV
	 R5gKUF+ivN4pnWtsKtal9eRaiZxyA1EOSXzJnysAUnOCgOh9mJVYf3VRTaNYTUbDg5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795044767;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IPAS-Result:IronPort-Data:IronPort-HdrOrdr:X-Talos-CUID:
	 X-Talos-MUID:X-IronPort-Anti-Spam-Filtered:X-IronPort-AV:Received:
	 Received:From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Outbound-Client-TLS:
	 X-Outbound-SMTP-Client:X-Outbound-Node;
	bh=XsTltNy4K+ZOHeH7fkByIrvQ9ntZWkhxLwV7eY3IWSc=;
	b=0T46Z7ycUqru7mRzVyFtsYKub1OSAo3ozlCudWQ25VkYDF6Agnd2JKxs8zlLy54ToeWB
	 HilsFZhX1ttZ26Vh095Eal5NW6HHPCg0KRRvPJSjr/VQisyE5sp3Nb9Rnv7HBBjc5Icz/
	 +8iCFHFwj9QUAuYl2vsg41jfbbkyQvV2ZHCLV+gKWFjKP3+pjix+3WW6FNy4sFiDXdlLO
	 guDruWEsKg80ofnWezhmNZYJUajKPPe4w+qU3WrJ1G6KtjaE6rWu5zOP1Aw8HAeC0bUEF
	 9dhDNVwuRfGURVQhrGoZvPaIOYpI8iTiFz1QFSNGucfEeVP8nHE10XtHze5LVFNqd7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cisco.com;
	spf=pass smtp.mailfrom=cisco.com;
	dkim=pass header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b="kyYRPdf/";
	arc=none smtp.remote-ip=173.37.86.76
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE0660A2635;
	Wed, 18 Nov 2026 23:32:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE0660A2635
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.a=rsa-sha256 header.s=iport01 header.b=kyYRPdf/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7036; q=dns/txt;
  s=iport01; t=1795044766; x=1796254366;
  h=from:subject:date:message-id:mime-version:
   content-transfer-encoding:to:cc;
  bh=XsTltNy4K+ZOHeH7fkByIrvQ9ntZWkhxLwV7eY3IWSc=;
  b=kyYRPdf/PoTyozQ4rDLMo9dB1vavwBehqSoZnANKuEFcVwibWtdDh92g
   bTKCArMopSLUF2MbAy+UqdlPPS0ztOgeSPpe+kM+eg11lHbpdKIvWQZ0c
   U4D2X/JDPoClDLOMrkOewmc26OGZmDUx/ahAjYgs2OqwJDIVPVPDEI/dU
   cpcuJGtoNGC2WK+nQsM8iBor1gYGeOcUaQlUdkOYAcLTRtjon8Qm7ZCEm
   YQ9OMJxaI6INlfcCiCL1RxyTaQtbKA98kBTFLDrvzDgr9L1cKs82NXHpm
   gtrWrK9t1vZFuvfSoiDVqhgrQqVOox9JMXRtVFnbPAzdTX7moYDA7rVeA
   g==;
X-CSE-ConnectionGUID: S0D/+9AwTiWGaFrQr54QKQ==
X-CSE-MsgGUID: FrA8RCvqS/+ZbHrRAvDqTQ==
X-IPAS-Result: =?us-ascii?q?A0ANAABDNP5q/5L/Ja1QChsBAQEBAQEBAQUBAQESAQEBA?=
 =?us-ascii?q?wMBAQFMgTAGAQEBCwGCF4E0YENJBIRTiBuHOIIhkVKMWRSBag8BAQEPSgcEA?=
 =?us-ascii?q?QGFBVEVjTwCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBAQECAQcFgQ4Th?=
 =?us-ascii?q?k8NkBUnVjUCJgJIFgESgwIBgnQDEQUBuUZ6gTKBAYR+2UuBbgYVgQouAYVzg?=
 =?us-ascii?q?m4BgXGECDuEQicbgUlEgRWCKlFvhBYEBQuDdYJqBIEOgRSBDIJRBYU6hByEE?=
 =?us-ascii?q?IgDCT+BAhwDWSwBVRMNCgsHBWNSMwMgCgsSEhgVAhQdEg8EFjIdcAwnEikXL?=
 =?us-ascii?q?1gbBgWBHHMUBBOBEoEDXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckI?=
 =?us-ascii?q?ggSCQETGiwKgRo1PAkmPxUMZwgDGgVAAh8IAg0MdDkQMB4kLwUaJj4bCoEMJ?=
 =?us-ascii?q?x8eGw4CChgNSBEsNwYPGQQ9AW4Hk0uCJgFhDwEOCGUJCysXOAEHCSIPQBcFF?=
 =?us-ascii?q?QECAwsGGAEBCjqSQSIlHoM8jV5rgTWfXIQrgWiILIIQlVQzhASTZpMImQgjg?=
 =?us-ascii?q?jaLMYogixwtDwkDhTeBaDyBWTMaCBsVO4JnUxkPj1gBAYYcgUGKKgG9ACYyA?=
 =?us-ascii?q?jsBAQcCBw4DC4FohF6LIgIDDBcHgU8BAQ?=
IronPort-Data: A9a23:XlrxOaMl2f0AponvrR13lsFynXyQoLVcMsEvi/4bfWQNrUpx1zIEm
 mBKDDuAa/3cYDOnKdx+aY/g9kgCvJOHy4drGnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gm4saQr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj6842IAZ1bKQHxudILmhg7
 8UCdWw0TSnW0opawJrjIgVtrt4oIM+uOMYUvWttiGmIS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzMnwsYDUXUrsTIIk3gOazhnr/WzZZs1mS46Ew5gA/ySQsjOmxaIuJIYHiqcN9sFyx9
 ljt4X3CRVIoPvyF8xOb3muQv7qa9c/8cMdIfFGizdZmiUOew0QfAQMbUF+8r+X/jEOiM/pSJ
 1ER8zgjsYAx+VatQ927WAe3yFaEuQQZQPJTHvc85QXLzbDbiy6aG2INZj1MctorsIkxXzNC/
 laPk8nkGn9pvaGZRGy18qqSq3W5OUA9NWYIaCkFZREI79nqvMc4iRenZtJiFrOly974Azf9x
 xiUoyUkwbYel8gG0+O851+vqzShupTEUCYr6QjNGGGo9AV0YMiifYPA1LTAxexLIIDcShyKu
 2IJ3pDPqusPFpqK0ieKRY3hAY2U2hpMCxWE6XYHInXr323FF6KLFWyI3AxDGQ==
IronPort-HdrOrdr: A9a23:uZZ7563qMInjmoom/Qg1OAqjBCwkLtp133Aq2lEZdPWaSL39qy
 nIppQmPH7P6Qr5N0tNpTntAsO9qBDnm6Kdn7N/AV7KZmCP01dAR7sO0WKN+UyEJwTOssUBkZ
 p6e6J9CNr/ZGIK7vrS0U2TEt4mztXC0I3Av5a9815dCSxndK1k6R50EUK4Hl0efng+ObMJUL
 eR+cZDoSOtYjAsbsq9DmQYROSrnaysqHufW29gOzcXrC+TkDiv9Ln2VzKc3hsYTndz5I1Kyx
 m8r+Q8jZ/Tyc1SDXTnphTu06g=
X-Talos-CUID: 9a23:bKPENW6Zkda7N1oChtsszxY4XYN0W2LhzUj/KmGiMHw0FIS2cArF
X-Talos-MUID: =?us-ascii?q?9a23=3AUbGYGQ/eR/7XO/oqnC8XoomQf+lyyvSUI14UqtJ?=
 =?us-ascii?q?FicOkLxZZJRuEsA3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,220,1787011200"; 
   d="scan'208";a="549409435"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2026 23:32:40 +0000
Received: from [127.0.0.1] (unknown [10.25.129.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 99D8918000204;
	Wed, 18 Nov 2026 23:32:38 +0000 (GMT)
From: Satish Kharat <satishkh@cisco.com>
Subject: [PATCH net-next v3 0/6] enic: add V2 VF receive control over MBOX
Date: Wed, 18 Nov 2026 15:32:26 -0800
Message-Id: <20261118-b4-enic-sriov-v2-vf-receive-control-v3-0-2cb25677aa8c@cisco.com>
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
X-B4-Tracking: v=1; b=H4sIAIo1/moC/43Py27DIBAF0F+xWHcqHjYOWfU/qi54jJupGmiBo
 FSR/73EySLLsBsBZ+69sIKZsLD9cGEZGxVKsQ/qZWD+YOMnAoU+M8ml5kZocCNgJA8lU2rQJLQ
 FMnqkhuBTrDl9g5v8yF2wODnDuvSTcaHztuWdRawQ8VzZx+2mnNwX+npdcn+b8ffUg9T7B2fLl
 T4eqe6HoHdCB2ONclpbId3CBQrO1YxqnhfVjw3a+00/UKkp/23lmtiwWw8pnurRBHDQs+VWI9+
 FUb15Kj699jCb3+SjaZ4zZTcno6XvqbVw8tFc1/UfgUMdAJIBAAA=
X-Change-ID: 20260916-b4-enic-sriov-v2-vf-receive-control-b5c40bdae5b9
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sesidhar Baddela <sebaddel@cisco.com>, 
 Aravind Dhanasekaran <aradhana@cisco.com>, 
 Reese Faucette <rfaucett@cisco.com>, Satish Kharat <satishkh@cisco.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795044758; l=7203;
 i=satishkh@cisco.com; h=from:subject:message-id;
 bh=OI5zLeFgcj3fzNBrTTUAFJs4aDlT07ZkR7EgZ+qezlo=;
 b=fX2Iay0/4vIr2H9fvtdW74OGwzRoLCaG3YZGE5Wm2eUfyZ/RHKHkaQjALOVDtWsY6kY5yZqgW
 G4f0PohDDhDCpJ+vBa7ONUOINVoNjmrDvIVvjRn6WuU/KvYZkSszJ/E
X-Developer-Key: i=satishkh@cisco.com; a=ed25519;
 pk=4BxbLoCGvHeIMH/PbpiNVx8/2IcTjFvqcr0AD8K6WLY=
X-Outbound-Client-TLS: ANONYMOUS;unknown [10.25.129.52];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.25.129.52, [10.25.129.52]
X-Outbound-Node: rcdn-l-core-09.cisco.com

An ENIC V2 VF cannot program its station address or receive filters
directly. The PF owns those resources and provides mailbox operations for
the VF to request changes. Add VF support for station-address,
address-list and packet-filter configuration.

The mailbox transport remains asynchronous. Serialize VF request/reply
transactions because each VF stores one expected reply and completion.
Receive dispatch continues processing unsolicited PF notifications, with
their acknowledgments deferred off the RX path. PF request processing is
unchanged.

Patch 1 adds netif_rx_mode_schedule_update(): cancel an old retry, reset
its backoff and schedule an immediate update while preserving address-list
synchronization state. Callers which lose device state unsynchronize the
affected lists before scheduling the update. Patch 2 serializes VF requests.

Patch 3 reconnects the VF after a lost or invalid reply. If sending a
request times out, the driver keeps its DMA buffer until both admin queues
stop. If they do not stop, the admin channel remains unusable. Failed
registration or recovery also keeps VF receive traffic blocked.

This series builds on two fixes already in net-next: one prevents premature
freeing of admin-channel DMA buffers, and the other gives V2 VFs the correct
mailbox source ID. The series also records whether the datapath is open, so
failed recovery cannot stop it twice or change a MAC on a closed VF. It does
not add generic datapath DMA quarantine or resolve stuck-queue DMA lifetime.

The remaining patches validate configuration replies, manage station and
administrative MAC changes, and program address lists and receive mode
through the sleepable path. An incomplete station replacement requires
fresh registration instead of guessing which changes the PF applied. The
deployed PF counts the station in its 32-entry UC table: reserve 31
secondary exact entries and use broad-mode fallback at 32 secondary
addresses.

This series implements VF receive control. It does not register
.sriov_configure; the in-tree V2 PF path remains dormant. A later PF
activation series must implement the mailbox operations and VF
policy/cleanup contracts before registering that callback.

The two prerequisite fixes from net v7 are now in net-next:
- b3ae89a2e167 ("enic: retain admin-channel DMA until queues stop")
- 65230b3ffd75 ("enic: require DEVCMD2 and set the V2 VF mailbox source")

The net-next base includes both prerequisite fixes.

Link: https://lore.kernel.org/netdev/20261109-b4-enic-dma-vf-index-net-generic-first-v1-20261010-v7-0-30ca6f467673@cisco.com/

AI assistance:

LLM tools assisted implementation, design/source review, drafting, test
automation and review triage. Sashiko was also used during earlier review.
The author is responsible for the submitted changes.

Validation:

- W=1 builds and Sparse checks found no new diagnostics at any of the six
  patch boundaries. The net-core change also compiled.
- A VF built from these six patches passed its supported controls and
  traffic tests. Three PF/VF pairings passed functional tests. Existing
  locking warnings outside this series limited lockdep coverage in two
  pairings. One PF rejected the VF's selected MAC as an administrative MAC;
  a distinct address worked.
- With later development and test patches, the full PF/VF stack passed
  VFIO, MAC, receive-filter, reload, ring-resize, VF-recreation and traffic
  tests at MTU 1500 and 9000 with lockdep enabled. Full PF/VF testing also
  passed bidirectional ICMP, TCP and UDP, administrative-MAC notification
  and jumbo traffic.
- Fault injection exercised mailbox recovery, failed open/stop handling,
  administrative-MAC refresh and late-open CQ cleanup. A test-only
  QP_DISABLE error with both queues stopped allowed VF reopen and traffic.

Signed-off-by: Satish Kharat <satishkh@cisco.com>
---
Changes in v3:
- Rebase onto net-next d6816d9a93b6, which includes the two net v7
  admin-DMA and VF-source fixes. Generic datapath DMA quarantine remains
  outside this series.
- After an admin send timeout, retain its mapped buffer until admin close
  observes both queues stopped. Do not reopen a quarantined channel.
- Track successful datapath opens and stops consistently, refuse reuse
  after a failed stop, and use actual open state for MAC handling.
- Use hardware CQ sender metadata to identify PF messages received by a
  V2 VF.
- On a late open failure after CMD_ENABLE, clean old data CQs only if all
  generic WQs and RQs report stopped. Generic stuck-queue DMA lifetime
  remains separate work.
- Allow reconnect after a QP_DISABLE error when both admin queues have
  stopped and the channel is DOWN.
- Clear local VF registration if administrative-MAC refresh fails after
  re-registration, and clarify the broad-mode ordering comment.
- Link to v2: https://patch.msgid.link/20260929-b4-enic-sriov-v2-vf-receive-control-v2-0-5962c10061b2@cisco.com

Changes in v2:
- Stop a failed registration-recovery handshake from requeueing its own
  reset worker indefinitely.
- Keep coherent generic MAC-operation failures as ordinary errors;
  reconnect only after explicit registration loss or an indeterminate reply.
- Enforce a cached fixed administrative MAC while the VF is down and repair
  an actual device-address mismatch during registration.
- Preserve compatibility with deployed async PFs at 32 secondary unicast
  addresses and exclude the station address from both secondary lists.
- Complete receive-mode transitions in one callback so concurrent list
  changes converge and synchronous operations return with filters
  installed.
- Link to v1: https://patch.msgid.link/20260921-b4-enic-sriov-v2-vf-receive-control-v1-0-67a0a6e08d43@cisco.com

---
Satish Kharat (6):
      net: add netif_rx_mode_schedule_update()
      enic: serialize V2 VF mailbox requests
      enic: recover V2 VF mailbox after request failure
      enic: validate V2 VF configuration replies
      enic: manage V2 VF station and administrative MAC
      enic: configure V2 VF receive mode over mailbox

 drivers/net/ethernet/cisco/enic/enic.h         |   55 +
 drivers/net/ethernet/cisco/enic/enic_admin.c   |   39 +-
 drivers/net/ethernet/cisco/enic/enic_dev.c     |   11 +
 drivers/net/ethernet/cisco/enic/enic_dev.h     |    1 +
 drivers/net/ethernet/cisco/enic/enic_ethtool.c |    5 +
 drivers/net/ethernet/cisco/enic/enic_main.c    | 1619 ++++++++++++++++++++++--
 drivers/net/ethernet/cisco/enic/enic_mbox.c    |  751 ++++++++++-
 drivers/net/ethernet/cisco/enic/enic_mbox.h    |   84 ++
 drivers/net/ethernet/cisco/enic/enic_rq.c      |   11 +-
 drivers/net/ethernet/cisco/enic/vnic_dev.c     |   21 +-
 drivers/net/ethernet/cisco/enic/vnic_dev.h     |    2 +
 include/linux/netdevice.h                      |    1 +
 net/core/dev_addr_lists.c                      |   21 +
 13 files changed, 2488 insertions(+), 133 deletions(-)
---
base-commit: d6816d9a93b66a12bf01e10037e377f3333ad6cc
change-id: 20260916-b4-enic-sriov-v2-vf-receive-control-b5c40bdae5b9

Best regards,
--  
Satish Kharat <satishkh@cisco.com>

