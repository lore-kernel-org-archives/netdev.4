Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769865;
	b=EYrZJGRuhec2zrHvCVvbfpE+cSje7IWQ/Wo77LaZpP5OBSQhkWkVf/PZ6kH5kJbTiB8m
	 GylwZbm/Hdu3M9NLvQXh7CaDZJYj+dF05iOFOMqFqSGj8Nukq1hExLgBy+uCfZZAlIJa6
	 z2uB/kAFfegt+xrmaXBVOQJgWrcyKF0Wz9vELHd4Zf7xuL6Y6H5Ev1iNGEQHLmTxIQ/ab
	 LotAYNIACWd10ZM3R1rlW4fBnKjI3s+Ydflq8J9z3p8l28Eu4XYTSbhTnhIsK1lj/krs4
	 HIGlTsEBN4PzNrdWoLZqB2/vNngRXRLqa/XAgButc1fe6qPzItHiEEa1+DLsfwrkvog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769865;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=/G+Xs6o+vba8qSnCFylsLowici9WWMguXuW+fm0sBPo=;
	b=0plRBvgKH3/ewmlRFwL85kyNNRzW5XYHnTPC9e3V2T2OZqGuN6dLiGYKiRVwFgJRlLBd
	 9dyPcYrGLOR+eS22kITHf+RkCyLIWW7/N4io7mbTG8ckyKpN7CHlyoh0bFpn9aMug+Hze
	 yDnaMAWHZazyMGgzmMTfSlIvy5MEF6Cwrh6HV12Frrl7TFEFp0bp5eBSWssgCI7rVVfJj
	 aJA6E+cXj11QFrDH7D2NVXPZTnQ+eoM8p3rjlyXZE6qG3BjG5fKNotXUAqngkBcCkc2Ye
	 UfQwOFJR97brQc07lRHEpNUYSesx3VD5hqxU/76HytlilSg1zsNdZCrAs8cXkIjtmnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GAom3ElN;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86098606A321
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:57:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86098606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GAom3ElN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/G+Xs6o+vba8qSnCFylsLowici9WWMguXuW+fm0sBPo=;
	b=GAom3ElNam8Ke7xhvAfQGaxPAM22BIqx3T0ZhG+96Dew+/BSEgN8n9kBAN6lMpw0SFfDy/
	LOzFxbYEFFrtkEiPIwhKpT3x/1tpr9PLqfW+E8mFM+M8c6Acip3HnDJJORxhilz/kctjXC
	cd7zG+Bwm2BryY14HnuDugHZCOgbcOY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-332-mkvI4AjPMM6S_gk3UoUF1w-1; Fri,
 27 Nov 2026 08:57:37 +0000
X-MC-Unique: mkvI4AjPMM6S_gk3UoUF1w-1
X-Mimecast-MFC-AGG-ID: mkvI4AjPMM6S_gk3UoUF1w_1795769854
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 915EF180060C;
	Fri, 27 Nov 2026 08:57:25 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C5FCD589;
	Fri, 27 Nov 2026 08:57:17 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: netdev@vger.kernel.org
Cc: Petr Oros <poros@redhat.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Simon Horman <horms@kernel.org>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	Grzegorz Nitka <grzegorz.nitka@intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Martyna Szapar-Mudlaw <martyna.szapar-mudlaw@linux.intel.com>,
	Ivan Vecera <ivecera@redhat.com>,
	Alice Michael <alice.michael@intel.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jesse Brandeburg <jbrandeb@kernel.org>,
	Patryk Holda <patryk.holda@intel.com>,
	Rinitha S <sx.rinitha@intel.com>,
	Aaron Ma <aaron.ma@canonical.com>,
	intel-wired-lan@lists.osuosl.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v5 0/4] ice: fix DFLT Rx rule handling for promisc and switchdev
Date: Fri, 27 Nov 2026 09:57:05 +0100
Message-ID: <20261127085714.1207361-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

Fixes for the promiscuous and allmulticast handling of the ice PF VSI,
and two fixes for the teardown paths they rely on.

Patch 1 stops the service task in ice_remove() before the PF is torn
down, where it was stopped before commit 8a37f9e2ff40 ("ice: move
ice_deinit_dev() to the end of deinit paths"). Patch 3 queues a filter
sync when a switchdev session ends, and a session that still runs when
the driver is removed ends in ice_remove().

Patch 2 refuses to leave switchdev mode while subfunction ports exist.
Leaving it then orphans the session, and patch 3 resyncs the uplink only
when a session ends.

Patch 3 lets the eswitch own the promiscuous configuration of the uplink
while a switchdev session runs and resyncs the uplink filters from the
netdev flags when the session ends, so the uplink no longer ends a
session without its catch-all Rx rule or with a stale promisc state.

Patch 4 subscribes PF VSIs to multicast with one VLAN agnostic promisc
rule pair instead of a pair per VID, so a wide VLAN trunk on several
bridge ports no longer exhausts the switch lookup table. A port with a
vid 2-4094 trunk goes from 12292 to 4104 FLU entries.

v1 to v4 were posted to iwl-net, and v4 went into the iwl pull request
of 2026-11-13, where the Sashiko review found real problems in both
patches [1][2]. This version reworks both and replaces v4. It is posted
directly to net, with intel-wired-lan in Cc, as discussed in the thread
on that pull request [3].

The final v5 also differs from what I described in my replies to that
review. Patch 4 no longer keeps per-VID rules for any PF VSI, so the
per-VID re-add, the rollback and the vid 0 recipe swap handling I
described there are gone, and ice_clear_promisc() clears only the VLAN
agnostic pair. Instead of skipping the allmulti branch for a promiscuous
VSI, the subscription is reconciled from both flags in one place, and
with patch 4 the resync of patch 3 no longer drops the multicast rules
or clears IFF_ALLMULTI. In patch 3 a new VSI state bit keeps every
filter sync away from the uplink promisc configuration while a session
runs, and patch 1 makes sure that the sync queued at the end of a
session cannot use a freed netdev when the PF goes away.

"ice: restore DDP state during PFR recovery", which Tony sent to net in
the pull request of 2026-11-25 [4], also stops the service task in
ice_remove(), but before ice_free_vfs(). Patch 1 keeps the place after
ice_free_vfs() that commit f844d5212cb0 ("ice: Fix removing driver while
bare-metal VFs pass traffic") chose, so that VF drivers in the host
still get answers from the PF while they are removed. The two apply
together without a conflict, and ice_remove() then stops the service
task both before and after ice_free_vfs(), so one of the two calls
should go.

Patch 4 builds on the ice_vsi_sync_fltr() changes of patch 3, which
needs the switchdev code from v6.10, so 6.6 and 6.1 need manual
backports of patches 3 and 4. The loss of the uplink VLAN filters across
a switchdev session that patch 3 mentions is older than this series, and
with patch 3 it also shows after a promiscuous session. I will send a
fix for it separately.

Changes since v4:
- Posted to net directly instead of iwl-net.
- New patches 1 and 2, found while reworking the switchdev fix.
- Patch order swapped, the switchdev fix goes before the multicast one.
- Patch 3, previously "ice: preserve uplink DFLT Rx rule on switchdev
  release", reworked as described above.
- Patch 4, previously "ice: skip per-VLAN promisc rules when default VSI
  Rx rule is set", reworked as described above. It now also keeps the
  multicast subscription of a promiscuous VSI when allmulti is cleared,
  unless another VSI holds the DFLT rule.
- Dropped the Reviewed-by and Tested-by tags of v4, both patches changed
  too much to keep them.
- All commit messages say how the problems were found and how the fixes
  were tested.

Link to v4:
https://lore.kernel.org/all/20260708125755.706263-1-poros@redhat.com/

Link to v3:
https://lore.kernel.org/all/20260701133601.2118382-1-poros@redhat.com/

Link to v2:
https://lore.kernel.org/all/20260622113428.2565255-1-poros@redhat.com/

Link to v1:
https://lore.kernel.org/all/cover.1781786935.git.poros@redhat.com/

[1] https://lore.kernel.org/all/179495967132.3136.6714105968141020753@kernel.org/
[2] https://lore.kernel.org/all/179495967304.3136.16113490698897758196@kernel.org/
[3] https://lore.kernel.org/all/20261125124652.3843638-1-poros@redhat.com/
[4] https://lore.kernel.org/all/20261125224428.4126195-1-anthony.l.nguyen@intel.com/

Petr Oros (4):
  ice: stop the service task before the PF is unloaded
  ice: do not leave switchdev mode while representors exist
  ice: resync uplink filters after a switchdev session
  ice: use a VLAN agnostic multicast promisc rule pair for PF VSIs

 drivers/net/ethernet/intel/ice/ice.h         |   1 +
 drivers/net/ethernet/intel/ice/ice_eswitch.c |  39 ++++
 drivers/net/ethernet/intel/ice/ice_main.c    | 233 +++++++------------
 3 files changed, 124 insertions(+), 149 deletions(-)


base-commit: aa40afa831ebfe45e40a23721711059f2ac584d4
-- 
2.56.1

