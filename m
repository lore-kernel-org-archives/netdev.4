Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769867;
	b=3vLvbGID/QAmo0cqLkEoHJOe35L64P9Hy6BR0CY6SNQTiUr44K5ErnBA6ttl3dfFTnUo
	 vgrsWBkuVbcVKQip7rPsYameWvPUC5bhPZTGWpm587aElg3rNtZj0bmpjgOccxEb16rzY
	 EVqhdK9Ah/uKNL3bScImeAdmb2AOMx6IzEpu2lpNQXZv6OY82ETBuRe7RQI/n9nw1zf2Q
	 B7BQXJylZxTKgvAjWLbSLe2/n4f32ezfvNeP5M9aVJEGRgqoUc7st012HfgZl05iRgwxk
	 Q2Y0BVyj8THVnkp7d/viIZfn1arNYknTN5cAdYpIHAU5FAJeBQvOhjzTrDkvQPTmhEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769867;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=/CZufDeWEyoWh6oaF3NNHG6Jv0YRcvv/UprgE0HwBNU=;
	b=XC1u81+4lM4kaVoDDP5lvcu4Jb5wxDYSYNKjpx1o7ILrLWBfwsbMBn9EJptFeCRs2QrJ
	 2IjGEwL6Sht6PVpqJ74MVrapoSw4ljgZJCt5GgOmoRUjGJpb3h4B+EJ5s8Uc3Nq94YR0f
	 UFvnf/Ts4NbtMYXvsKvvCTWiDpTGEt65jyLyaEhf3/I31nwlnyWBFF3Rr3YoaiiyP5ziI
	 QoVd9ix2M9zPn4/dT0qVo7tvfj+/TpEjRZ1oTCIniz1Y4u72UZ20UkqMLLhRZPiDvEGg3
	 x/KoqSnCQCfcC2qnHjhfQV7PFDTbKow2IM2ydArEsPv3Wtvs3l9ObU+z/ogBN6bCUKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gYIwowfJ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5489606A330
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:57:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5489606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gYIwowfJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769866;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/CZufDeWEyoWh6oaF3NNHG6Jv0YRcvv/UprgE0HwBNU=;
	b=gYIwowfJyKY2j8ENlGWN7cjl7NWJyD7iZvZpSTAWWaO3+JyEa9qFMm312jz2O1/ssH8ItJ
	gjlepDaHawoKUDRQgkcgQ4JDaX2nlOZoTVRaNk2hSjMBw5JUIIA9x4lyWY+2rsDwSPkJbP
	yTu6569vI1pEmBBJIhBQAtPAlc4p2E8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-JxyFEhGSMdWy6zwHoX7Xmg-1; Fri,
 27 Nov 2026 08:57:39 +0000
X-MC-Unique: JxyFEhGSMdWy6zwHoX7Xmg-1
X-Mimecast-MFC-AGG-ID: JxyFEhGSMdWy6zwHoX7Xmg_1795769856
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B45D1944AAF;
	Fri, 27 Nov 2026 08:57:32 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F21245B1;
	Fri, 27 Nov 2026 08:57:25 +0000 (UTC)
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
Subject: [PATCH net v5 1/4] ice: stop the service task before the PF is unloaded
Date: Fri, 27 Nov 2026 09:57:06 +0100
Message-ID: <20261127085714.1207361-2-poros@redhat.com>
In-Reply-To: <20261127085714.1207361-1-poros@redhat.com>
References: <20261127085714.1207361-1-poros@redhat.com>
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

Commit 8a37f9e2ff40 ("ice: move ice_deinit_dev() to the end of deinit
paths") moved the service task stop and the cancel of the AdminQ event
waiters from after ice_free_vfs() to the end of ice_remove(). Since then
a queued or running service task can still walk pf->vsi[] while
ice_remove_arfs(), ice_unload() and ice_deinit() free the aRFS filters,
the netdev, the LAG and the VSIs. A last run that takes longer than a
timer period also arms the service timer again after the stop at the
end has deleted it, and the timer then fires after the PF is freed.

Stop the service task and cancel the waiters after ice_free_vfs() again.
The stop in ice_deinit_dev() stays and deletes a timer armed by the last
run. As before that commit, a devlink flash that is still running when
the driver is removed fails, at the latest when its next AdminQ wait
times out.

Found by AI code review. Validated on an E810-C (FW 8.1.1, ICE COMMS
package 1.3.55.0) with a test-only 12 s delay in ice_sync_fltr_subtask()
after it took the VSI pointer, armed right before a promisc change and
rmmod ice. Without this patch KASAN reports a slab-use-after-free in
ice_vsi_fltr_changed() on the freed main VSI, and the kernel then faults
in call_timer_fn() on the timer function of the unloaded module. With it
rmmod waits for the run and nothing is reported. Also tested by removing
the driver during switchdev sessions and with four VFs bound to iavf. No
kernel selftests cover this.

Fixes: 8a37f9e2ff40 ("ice: move ice_deinit_dev() to the end of deinit paths")
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- New patch. The uplink resync in patch 3 queues a filter sync when a
  switchdev session ends, and a session that still runs when the driver
  is removed ends in ice_remove().
---
 drivers/net/ethernet/intel/ice/ice_main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index 47c6798c97e8f1..6dede87b78944f 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -5387,6 +5387,9 @@ static void ice_remove(struct pci_dev *pdev)
 		ice_free_vfs(pf);
 	}
 
+	ice_service_task_stop(pf);
+	ice_aq_cancel_waiting_tasks(pf);
+
 	if (!ice_is_safe_mode(pf))
 		ice_remove_arfs(pf);
 
@@ -5407,7 +5410,6 @@ static void ice_remove(struct pci_dev *pdev)
 	ice_deinit_hw(&pf->hw);
 
 	ice_deinit_dev(pf);
-	ice_aq_cancel_waiting_tasks(pf);
 	set_bit(ICE_DOWN, pf->state);
 }
 
-- 
2.56.1

