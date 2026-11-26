Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795696317;
	b=xjYIYYF5jH8ITzPNi+yCl14zVwWod8cWsN/eZVKunjEhfUrVP7BJRzlSk8mp7SherhfI
	 Na8FTz1yMRWV2WoKXlUzezBBTkxcg9AnRAwGUlcDWqFvVav26QnG04U27+UiydPgJj/1C
	 KYSIo/iKAWhAhp85+Jes1GSN2hdsxawgi3hN3kOyA6pWJPJPUR9MUTrjqhj0o8ScTc8Mu
	 DLabr6697fLRu+IE93PODwHZy8BqV25y+/5hljUYFOr66weDniFuDdVsT2OcTxIw6zpOW
	 72UimV9e9M40RCcvTdsvfU4o+8c/JC9qUMdgfQMe8sxqjWqtzxDsJBqpKtiCVCdEfig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795696317;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=cFTRdaPd9FLNp5xRWJD0hfOG8q26IX70T4fOt+lnlIs=;
	b=4BE9/GPZ2DE6xHQdrB5ZLlYiL3tn0/xgQiqWp5+vyiMc0wockArwKR2YSuLjG0iVR9b8
	 ilymfMC1ByNJJ2wb0wcthhaD9ahKwhKRarcAIhGij02K/tSY1OE3xQm9cVO8/3JtuKmGI
	 c9gM1InI99vjtQ+yDJIjHFSqtvxa1S1TFacXqBh/tp6/2Y7TYAHa2cJ7IfhrrZ/FGbPU1
	 VFA5kxLC12FvKyc0FUxsM6A4UDEqR7t+pvXxpUl/wqJQP0HYypqXDEk25v88RY/8Z/IRd
	 Y/H7sOoHCvusC6/8L0OpPqSaHEkzXxodyb/p3aBEOXFD4dqD5gDXY4ImTqzKAeSdOHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XG5Hq4ZE;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACA38606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACA38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XG5Hq4ZE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795696315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cFTRdaPd9FLNp5xRWJD0hfOG8q26IX70T4fOt+lnlIs=;
	b=XG5Hq4ZEaQCne1dGM7Q0SnbBtygJ12BgHIbB0CKYyTQJy0nfevzbgJIe2RDH3yJjkSOlLv
	zIB5/7CFOJ+Q3rWlqVTl6gNZ0Ev6nobeAInU84a8CDXyDTCJDp02cKmB4d9IQudtXsvnpK
	XmPOkwUg92BIE85tTx7/kWcbq4UNTro=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-584-4dIC1Vp1M8u588k5GFNOTA-1; Thu,
 26 Nov 2026 12:31:43 +0000
X-MC-Unique: 4dIC1Vp1M8u588k5GFNOTA-1
X-Mimecast-MFC-AGG-ID: 4dIC1Vp1M8u588k5GFNOTA_1795696291
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3A8F5180065C;
	Thu, 26 Nov 2026 12:31:31 +0000 (UTC)
Received: from jramaseu-thinkpadt14gen5.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 76F4D3000229;
	Thu, 26 Nov 2026 12:31:28 +0000 (UTC)
From: Jakub Ramaseuski <jramaseu@redhat.com>
To: anthony.l.nguyen@intel.com,
	przemyslaw.kitszel@intel.com,
	intel-wired-lan@lists.osuosl.org
Cc: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	netdev@vger.kernel.org,
	Jakub Ramaseuski <jramaseu@redhat.com>
Subject: [PATCH iwl-next 0/3] ice: share RSS hash profile IDs between PFs
Date: Thu, 26 Nov 2026 13:31:11 +0100
Message-ID: <20261126123114.893916-1-jramaseu@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

The DDP package gives all PFs of a device 126 RSS hash profile IDs, and
since commit a6d63bbf2c52 ("ice: Implement RSS settings for GTP using ethtool")
the default RSS configuration of each PF takes 19 of them. On devices
with 8 PFs, like the E830-XXVDA8F, the PFs probed last lose part or all
of their default RSS, and RSS configurations requested later fail,
for example for VFs:

  ice 0000:6c:00.0: ice_add_rss_cfg failed for VF 0, VSI 2, error:-5

The PFs configure the same profiles, and firmware already lets them
share an ID; what is missing is a way for a PF to find the ID another PF
uses for an extraction sequence. This series keeps a list of the shared
IDs in struct ice_adapter.

Dropping part of the default RSS configuration, for example the 12 GTP
entries added by a6d63bbf2c52, would also make it fit, but it would take
the default GTP hashing away from users, which feels more like
a step back, and it only moves the limit: without sharing, the IDs
grow with the number of PFs times the configurations of each,
so VFs and ethtool settings can exhaust them again. With sharing,
they grow with the number of distinct configurations.

Patch 1 fixes a profile ID leak on the error paths of ice_add_prof(). It
is independent of the rest and comes first, so that it can be backported
on its own.
Patch 2 shares the IDs of the default RSS configuration, which fixes the
exhaustion.
Patch 3 shares the IDs of all RSS profiles added through the flow API
(ethtool, VFs, replay).

On an E810-CQDA2 split to 8 PFs, with a VF on each PF and the same
"rx-flow-hash" settings on every VF, the PFs hold 126 IDs and fail 70
allocations before the series, and hold 37 IDs with no failures after
it.

Patch 2 and 3 were also checked on an E830-XXVDA8F with
one VF per PF and "rx-flow-hash {tcp,udp}{4,6} fn" on each,
all 32 changes succeed with no ice errors.

The series is for iwl-next although patches 1 and 2 carry Fixes tags:
sharing profile IDs between PFs is a new feature rather than a plain
fix, and patch 2 builds on the shared devlink instance holding struct
ice_adapter, added by
commit 6381ef1b1338 ("ice: use shared devlink to store ice_adapters instead of custom xarray")
which is not in net, and it is too large for net.

Notes for reviewers:
- CORER, GLOBR and EMPR clear the IDs of all PFs, and every PF empties
  the list while preparing for such a reset, before it can allocate
  again. A PF that prepares late can drop entries made by a PF that has
  already rebuilt; that only costs sharing, the IDs stay valid and are
  freed as private ones. Skipping the flush on some PFs would instead
  let a PF join an ID the reset freed, which firmware may meanwhile have
  given to a PF the list does not track (DPDK, a PF assigned to a VM).
- Sharing relies on the device serial number identifying one device,
  like the rest of struct ice_adapter; E825C and devices without a
  serial number don't share.

Jakub Ramaseuski (3):
  ice: release the profile ID on ice_add_prof() error paths
  ice: share default RSS hash profiles between PFs
  ice: share all RSS hash profiles between PFs

 .../net/ethernet/intel/ice/devlink/devlink.c  |   2 +
 drivers/net/ethernet/intel/ice/ice_adapter.c  |  13 +
 drivers/net/ethernet/intel/ice/ice_adapter.h  |   7 +
 drivers/net/ethernet/intel/ice/ice_ethtool.c  |   2 +-
 .../net/ethernet/intel/ice/ice_flex_pipe.c    | 356 +++++++++++++++++-
 .../net/ethernet/intel/ice/ice_flex_pipe.h    |   9 +-
 .../net/ethernet/intel/ice/ice_flex_type.h    |   1 +
 drivers/net/ethernet/intel/ice/ice_flow.c     |  14 +-
 drivers/net/ethernet/intel/ice/ice_main.c     |   5 +
 drivers/net/ethernet/intel/ice/virt/rss.c     |   2 +-
 10 files changed, 395 insertions(+), 16 deletions(-)

-- 
2.56.0

