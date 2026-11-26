Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686243;
	b=ovGEQ53eSoTI9q8kidnxqZcSwrvzH/XB4ih1Xqr7Hj4RH+XbNiTS82OeBgLFXAJri0qX
	 2sRK8PJ3G0eZzGmoMrEopIhiZ4L/qyXs/j1JmSci+BP3aranXa5WK0glu0BxbITD+ErBo
	 ZhY9GaoJcB/l1lcqA80R/OnCLvTaeYBrUfiyTnDy40wmx724/kVe2LX06LHXTbO42bvO3
	 Y5DmGcWonwHAG7yRtjNMDxPZtKhJMAhX/VGZU2Env5i6j2tlZ3Peuz0LVB1Ic8vNEv66z
	 wnyHj+mByHBmcnSxEdC9io9FJvAOw3ibgZkXlo/gfyp6MYFjyi3kL3EJYyQDv859mJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686243;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ZCgvsI7+dUpagWiTbJuZkC55rxcy0ScU6ynHzDiYLRQ=;
	b=Ts6ukrRuiCK1PiFNUqwJmCRc04zNCmbJWOGkyDs0q8AtnV37642NjMBTFXWu61FrScnw
	 7Vm7xxp00tgOc5MrbGRY6lalSgCmiTZNICudNRl1KNVMdxdzofI+nZXffkXhWyJXs7VhJ
	 +sVvzL47lp94PbwWetUQxjy0MXZ+hYgM5O2dtGd6KjnvMk8aiHkKVff/WMlUpogQab5IS
	 oxABKk5Q3tkGUQ25NFHIzIZgs10hgayHZ2I+XR8iFqIFTRK3GbIy32C9h5p7rTumws9mT
	 Se4EinAVxoLwgelSN2b9/lHMXTKgJeCn0KwIpTmWCYedP3pbzPck357Bv72nS/02nIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NYtrBgtD;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8B2606A32E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:44:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F8B2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NYtrBgtD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZCgvsI7+dUpagWiTbJuZkC55rxcy0ScU6ynHzDiYLRQ=;
	b=NYtrBgtDk2vh6IQVAHPGFc8t8FfmvWu1ll5bIE3vYUgu+clFwIWiYVFBW44NqJTY0WRbpB
	Yz7H9biIMnMawm4TJENc8O3zSPrG7rjKFAh6Dyw6+X2fjbSh20FXZ4O2BYrdpRZ01Jk6uT
	3J4LU+HsCIAwyxH6ijN987vdEdO44Ec=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-450-YWkAUnXRMh6L4GgjOep56g-1; Thu,
 26 Nov 2026 09:43:56 +0000
X-MC-Unique: YWkAUnXRMh6L4GgjOep56g-1
X-Mimecast-MFC-AGG-ID: YWkAUnXRMh6L4GgjOep56g_1795686234
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73F7A1955F34;
	Thu, 26 Nov 2026 09:43:53 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id BC0661801976;
	Thu, 26 Nov 2026 09:43:48 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: Przemek Kitszel <przemyslaw.kitszel@intel.com>
Cc: netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	Michal Schmidt <mschmidt@redhat.com>,
	edumazet@kernel.org,
	horms@kernel.org,
	pabeni@redhat.com,
	davem@davemloft.net,
	Jiri Pirko <jiri@resnulli.us>,
	andrew+netdev@lunn.ch,
	jacob.e.keller@intel.com,
	jedrzej.jagielski@intel.com,
	anzaki@gmail.com,
	brett.creeley@amd.com
Subject: Re: [PATCH net-next v7 06/15] ice: bump to 256qs for VF
Date: Thu, 26 Nov 2026 10:43:44 +0100
Message-ID: <20261126094346.40180-1-poros@redhat.com>
In-Reply-To: <20261121230123.316391-7-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com> <20261121230123.316391-7-przemyslaw.kitszel@intel.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On Sat, 21 Nov 2026 23:55:33 +0100, Przemek Kitszel wrote:
> more than 16 queues. Other VSI types and XDP rings had the same broken
> mapping, now they fail too when more than 16 queues find no contiguous
> range. ice_prepare_xdp_rings() then must not clear any queue bits, as it
> got none.

On the PF that failure ends in an oops, and rtnl stays locked.

  echo 4 > /sys/bus/pci/devices/0000:04:00.0/sriov_numvfs
  for i in 0 1 2 3; do
          echo 0000:04:01.$i > /sys/bus/pci/drivers/iavf/unbind
  done
  sleep 1
  echo 250 > /sys/bus/pci/devices/0000:04:01.2/sriov_vf_msix_count
  echo 187 > /sys/bus/pci/devices/0000:04:01.1/sriov_vf_msix_count
  echo 20 > /sys/bus/pci/devices/0000:04:01.0/sriov_vf_msix_count
  ethtool -L $PF combined 24

  Failed to allocate queues. vsi->idx = 0
  Error during VSI rebuild: -12. Unload and reload the driver.
  Oops: general protection fault, [...] [#1] SMP KASAN PTI
  RIP: 0010:ice_get_channels+0x234/0x6b0 [ice]
   channels_prepare_data+0xe9/0x150
   ethnl_default_notify+0x390/0x8e0
   ethnl_default_set_doit+0x48d/0x10a0

On my E810-C (512 queues per PF, the PF at its default 6 channels) the
PF has 38 queues to choose from at that point, its own 6 and two free
ranges of 16. The parent returns 0 there and leaves the PF without link
until a PF reset. With 15 queues to choose from it oopses in the same
place.

Regards,
Petr

