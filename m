Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686227;
	b=Kcpltqgh6c9TANvoLoXour9IARm/1+Q6UZPK7t5iSxLCj6unGZn9lQXHYT91EbEz/1Sq
	 miu5OImVE9KpQqU6lo9lt/XH6HdEtcBozRt8aZJb1/YKnT8kfS4H2TkKniqoUKQCYCie9
	 BzmJEoraf0g5n8BbYai84H5/svDPTXHXos5iwduLGL292VCasoSTMxi9ytth9hJN+0wTe
	 iFnQIQDSGJWhslCOSxmNxattHlohvSldMCAiUm+Q7CB+jhRM5ItcL0SZ2bHb4cp5fXoQV
	 4S/yiUZYLIN1IBaczTuMGwJqaRsiXnZzTC3Tew9pGVhkg+2GhrMwWOfCOWdX9kXJvmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686227;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=xOOj0KD89ehMHVktEzoEa2NIGGnWnnUxRW5/ThMOwg8=;
	b=FAzGrLNwb+IEUVv5dRgjlemaNwOMlgE6SZZBOjjvuYImhXFn4rARJMjPqPH2af7AOcbR
	 4ZXcPCEPeZAEXvREMX2igLPsSeGt9nsVg/3DN8gChuZMq4X0XzA70IDEDxu60D4PNPAcI
	 dH0cgnR8uKX2ZAp0X6OmoUoTPYEiENqYhNjFur20lYNJi2P6wraMD0cq64UANP26TxvaP
	 Od1EnBZALckubK/Ur4kGLMr68xoBMUB7Fe0dIuSjeU3JVd5WM7ohh82A9H+Jx3JsJtVI2
	 BXmqMHLkkq6eP1XRNk+8eDUe0s4n0wST4ivG+MrW9YHVja8n111EwYOGWmzWNj4UeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T+iAA3ti;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A295606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A295606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T+iAA3ti
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xOOj0KD89ehMHVktEzoEa2NIGGnWnnUxRW5/ThMOwg8=;
	b=T+iAA3ti1O+A82CYvUqVR5vl+I93pq7Tlsp1jRZYIgGlJtzsecu0Fqjs54qRmB/76ILy/9
	4tX4bmmX5tZK8xcdgcaobfKvS0wjtR66QfXTiFuTHtG3AgYSdPt11utqhd755kxhk05H3L
	H/kYwr4pJMSoTUJyTcLul13peg0lnao=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-167-OFeH5XE2OpaGmm-ISgpl3g-1; Thu,
 26 Nov 2026 09:43:32 +0000
X-MC-Unique: OFeH5XE2OpaGmm-ISgpl3g-1
X-Mimecast-MFC-AGG-ID: OFeH5XE2OpaGmm-ISgpl3g_1795686210
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 38D5A1956052;
	Thu, 26 Nov 2026 09:43:30 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 7A5EB18004FF;
	Thu, 26 Nov 2026 09:43:25 +0000 (UTC)
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
Subject: Re: [PATCH net-next v7 15/15] ice: support up to 256 VF queues
Date: Thu, 26 Nov 2026 10:43:19 +0100
Message-ID: <20261126094321.40071-1-poros@redhat.com>
In-Reply-To: <20261121230123.316391-16-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com> <20261121230123.316391-16-przemyslaw.kitszel@intel.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On Sat, 21 Nov 2026 23:55:42 +0100, Przemek Kitszel wrote:
> Note that VF reset is deferred to service task. A message from the VF
> while that reset is pending does the reset instead, without a reply, so
> the VF never sees a half-applied change.

Sashiko asked whether this reset can run at the same time as the VSI
rebuild of a sriov_vf_msix_count write. It can. On my E810-C, with KASAN
and lockdep, this loop crashed within its first two iterations in both
of my runs.

  VF=0000:04:01.0
  echo $VF > /sys/bus/pci/drivers/iavf/unbind
  sleep 2
  for i in $(seq 100); do
          devlink resource set pci/$VF path rss_lut size 512
          echo 65 > /sys/bus/pci/devices/$VF/sriov_vf_msix_count
          devlink resource set pci/$VF path rss_lut size 64
          echo 17 > /sys/bus/pci/devices/$VF/sriov_vf_msix_count
  done

The reports differ from run to run, this is one of them.

  BUG: KASAN: slab-use-after-free in ice_vsi_free_q_vectors+0x498/0x550 [ice]
   ice_vsi_decfg+0x145/0x350 [ice]
   ice_vsi_rebuild+0x232/0x1420 [ice]
   ice_sriov_set_msix_vec_count+0x447/0x6a0 [ice]
  Freed by task 649:
   ice_vsi_free_q_vectors+0x30e/0x550 [ice]
   ice_vsi_decfg+0x145/0x350 [ice]
   ice_reset_vf+0xbf1/0x1260 [ice]
   ice_service_task.cold+0x94/0x620 [ice]

The missing lock is older, as Sashiko says. The parent can crash in the
same write right after an iavf unbind, once in 21 tries here, but it
survives 100 iterations of this loop with "ip link set $PF vf 0 trust
on" and "off" in place of the devlink commands. With the deferred reset
a LUT change followed by the write is enough.

> +	scoped_guard(devl, pf_devlink)
> +		err = devl_nested_devlink_set(pf_devlink, devlink);

Sashiko also asked whether this can deadlock against
ice_tear_down_devlink_rate_tree(). In legacy mode it does. v7 blocks
within the first two cycles of this loop, three runs out of three, and
rtnl stays locked.

  ethtool -K $PF hw-tc-offload on
  while :; do
          tc qdisc add dev $PF root mqprio num_tc 2 map 0 0 0 0 1 1 1 1 \
                  queues 3@0 3@3 hw 1 mode channel
          tc qdisc del dev $PF root
  done &
  for i in $(seq 10); do
          echo 62 > /sys/bus/pci/devices/0000:04:00.0/sriov_numvfs
          echo 0 > /sys/bus/pci/devices/0000:04:00.0/sriov_numvfs
  done

  task:bash            state:D
   ice_init_vf_devlink+0x135/0x280 [ice]
   ice_sriov_configure.cold+0xe97/0x1116 [ice]
   sriov_numvfs_store+0x288/0x490
  task:tc              state:D
   ice_tear_down_devlink_rate_tree+0x47/0xf0 [ice]
   ice_setup_tc+0x44c/0x3100 [ice]
   mqprio_enable_offload+0x38e/0x5a0 [sch_mqprio]

The parent finishes the ten cycles. With patches 1 to 4 of your
"ice: fix DCB lock ordering" on top v7 does not block there either, so
this series depends on that one.

Each nested VF instance adds 40 bytes to the DEVLINK_CMD_GET reply of
the PF. I measured 240 bytes without VFs and 2720 with 62, and my card
stops at 64 VFs per PF. Does the reply still fit with 128 or 256?

Regards,
Petr

