Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769869;
	b=QdeMHnwO6uMlee9URqK7grpZNydAlmGnnodWFS75tEIkuSBXxgQ7omUwPeGlZs39+LUR
	 KXNaEG/wOU1hrjapzgAi8LeTyizUYkQj/0j2YDq6NIqqtq6tgNjFCKMJOfTaESg0Lv1c6
	 hzbJ5c14nfsbwEbUxdVgC6nXEbJ/7GUgj5KfVr+/nGVr2q74hjAtsumhjN88+YrGXbyfg
	 v+zi6Kysx+9jwf+qQOVtz0lCc+pEOEQardFcbhj/qalCfsZX8tnwzr5w4MKSK9Ym1N8Pv
	 RyCMWA7eM2k0PL0ws+5vnHNHZQMsM7qk1mQ9nAiAzIlZAfGSWeu/ksE328UjKrVG/YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769869;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=8v8Ip+plxXN89vEKmV5QJRl4QCWxKVrwNkDboP/e/Tk=;
	b=ZRLIlWlvYq4074ojq8R2AQkBEWI3edJvI56O0vy8BG3tewuA8rsAXh9bVa3hpF9hjoLy
	 s9DXWNZ/5A0GPG4u1CrVsOHLlCL3eifrZytBy0Od7rH/q8bnqjRAg7T+uO1V2S7e/7nNU
	 Q3JCxNSpIIXfcV2sx2RwMIRlkh3/CnhDA8Ovf4NkOiglcucLyaO8C37K5GgF9nClwh6ms
	 mqvB+t5HyCXsZuKcL+LHwZEj6MS3wEEWfyGcDYqKs0fMt1MaLfp0l7abWwmfesgJuiRXU
	 +lub+9G4x3rsH/5MjB9uDiv20opmtNkPA3qNOQQSiBDvbxjsDwk3t6QkSJBd6TzUdng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xp9li398;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512B3606A33F
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:57:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512B3606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Xp9li398
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8v8Ip+plxXN89vEKmV5QJRl4QCWxKVrwNkDboP/e/Tk=;
	b=Xp9li398V1f930unQAamTqv/geUCLuYrb8E/avb51vW+gIkZma4W0EoQzh7wCi7lczpfJu
	Ph65tgTlxyE8EtRme2+iAhz9x8riI9Xgidqz+egWZDRRBMkR5TjWa9GzCvLntl4bdbXBHe
	ZERILd/LSzoSh3SFpyWWTgiHWXncs9g=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-504-rGpobC8YPeCwkelkffy9sQ-1; Fri,
 27 Nov 2026 08:57:42 +0000
X-MC-Unique: rGpobC8YPeCwkelkffy9sQ-1
X-Mimecast-MFC-AGG-ID: rGpobC8YPeCwkelkffy9sQ_1795769859
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CC57F1955D8B;
	Fri, 27 Nov 2026 08:57:38 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BB1B644B;
	Fri, 27 Nov 2026 08:57:32 +0000 (UTC)
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
Subject: [PATCH net v5 2/4] ice: do not leave switchdev mode while representors exist
Date: Fri, 27 Nov 2026 09:57:07 +0100
Message-ID: <20261127085714.1207361-3-poros@redhat.com>
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

ice_eswitch_mode_set() refuses a mode change only while VFs exist, but a
subfunction port has a representor and a switchdev session too. devlink
core usually refuses the change first, because of the devlink rate nodes
the representors export, but ice exports none while DCB is active. A
switch to legacy then destroys the representor xarray under the running
session, the representors leak, and the uplink stays in its switchdev
configuration.

Refuse the mode change while the representor xarray is not empty.

Found by AI code review. Reproduced on an E810-C (FW 8.1.1, ICE COMMS
package 1.3.55.0) with the firmware LLDP agent off, without kernel
changes:

  dcb ets set dev $PF tc-tsa all:ets tc-bw 0:50 1:50 prio-tc 1:1
  devlink dev eswitch set pci/$BDF mode switchdev
  devlink port add pci/$BDF flavour pcisf pfnum 0 sfnum 88
  devlink dev eswitch set pci/$BDF mode legacy

The last command succeeded, the representor netdev stayed registered
and promisc off no longer took effect on the PF. With this patch the
command fails with "Remove all subfunction ports before changing
eswitch mode". No kernel selftests cover this.

Fixes: 977514fb0fa8 ("ice: create port representor for SF")
Signed-off-by: Petr Oros <poros@redhat.com>
---
v5:
- New patch. Without it a switch to legacy can orphan a switchdev
  session, and patch 3 resyncs the uplink only when a session ends.
---
 drivers/net/ethernet/intel/ice/ice_eswitch.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/ethernet/intel/ice/ice_eswitch.c b/drivers/net/ethernet/intel/ice/ice_eswitch.c
index 6e7bba4738989b..c96b201901f48c 100644
--- a/drivers/net/ethernet/intel/ice/ice_eswitch.c
+++ b/drivers/net/ethernet/intel/ice/ice_eswitch.c
@@ -354,6 +354,13 @@ ice_eswitch_mode_set(struct devlink *devlink, u16 mode,
 		return -EOPNOTSUPP;
 	}
 
+	/* subfunction ports have representors too */
+	if (!xa_empty(&pf->eswitch.reprs)) {
+		NL_SET_ERR_MSG_MOD(extack,
+				   "Remove all subfunction ports before changing eswitch mode");
+		return -EOPNOTSUPP;
+	}
+
 	switch (mode) {
 	case DEVLINK_ESWITCH_MODE_LEGACY:
 		dev_info(ice_pf_to_dev(pf), "PF %d changed eswitch mode to legacy",
-- 
2.56.1

