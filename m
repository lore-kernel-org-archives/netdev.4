Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795610836;
	b=k9fGEp10a/6IawwAbMbxLeRGERCexizg1ryHHe4Az7cQ853YOccfbbsqYHY6HXjGETnn
	 dSGa7gHQVQQ1nJHRLgDUeYHOsjD7+AXz60hPwQO5AXRuXc9EaARWnvsrwN+eW1iHILb+D
	 XUNdQa+LqHvdNCSTTeKsnWn4Zbl4t2atSQ4TfPCWCTxJMVvZo/mHfLKphis/Xiyq9B0ey
	 QvrE6i9j4TmlUGQ+cmHkcWbrPq8qRab/7wvoekQ4vEY4hU15mChKVzd4xym+N5diYZ8FI
	 JvhtPtizq6WhsLmKfYLhx0Mba83zBwyVdMERZ4niBetgRn9Hl7ucBESr+2CllItmqKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795610836;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=UOswtumIqV73ZgPCkcgKR3Mw8N0TWTgh9bOwnMdx/iw=;
	b=e+bbG3CAUCZxAujp+aEufp2fRPo6wu1dl6naSl3KER+9eILFKdKSMU691qU9DLI87ZCX
	 5Xaksw1feiibHIT5xaw2BckwaD7AnvQv+KeVtQFaCejP6VdVbos+OaMN44cpIXJrP7QTp
	 uEtpazk+0HCSbhETu2Go5/VDMjievVHeFYR7dXze2W06svibFLWuCCK4E4Qlc5pjp9MWS
	 /Td3ozWtBDTVPAf7JAU67cqN7E/oD+loxOen9N1u9lJuX44W8MjU2XdVL4CEf1HCiDpjV
	 OCRco5WpEKjNWKLFvic0dCvb6Y5S13gVZFPwlhwNx74I0XJ1FslqhqK8GKlRQ0Zrr8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OWI+UqWe;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DCA606A323
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 12:47:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DCA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OWI+UqWe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795610835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UOswtumIqV73ZgPCkcgKR3Mw8N0TWTgh9bOwnMdx/iw=;
	b=OWI+UqWeCkK2ChqigALQs7HZMQI3oL73swdarbt/HfpXqx1F3b0YDylb0bip8Ffs+Oacr7
	eY+dStYt17k/JqIcQ936oHZMN7toK7FQYNbBcb2rL+rrqpVrYzwWCkI0z6Dv24kaSGdxiM
	CygsoHEkRRnfJzehtLyi6ONiY/zAF8o=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-342-xH8KfcU-PdWNfgvM9U5ZvA-1; Wed,
 25 Nov 2026 12:47:08 +0000
X-MC-Unique: xH8KfcU-PdWNfgvM9U5ZvA-1
X-Mimecast-MFC-AGG-ID: xH8KfcU-PdWNfgvM9U5ZvA_1795610825
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DE3541801323;
	Wed, 25 Nov 2026 12:47:04 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8528E195B3D0;
	Wed, 25 Nov 2026 12:46:59 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Magnus Karlsson <magnus.karlsson@gmail.com>
Cc: Petr Oros <poros@redhat.com>,
	netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org,
	edumazet@kernel.org,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates 2026-11-13 (ice)
Date: Wed, 25 Nov 2026 13:46:51 +0100
Message-ID: <20261125124652.3843638-1-poros@redhat.com>
In-Reply-To: <20261118115915.116177-1-poros@redhat.com>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com> <20261118115915.116177-1-poros@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Thanks everyone for the input. Jakub wrote that netdev is happy to take
the patches directly once a maintainer acks them there, and Przemek
that they will ack more on netdev. Building on that, here is a
suggestion for how it could look. It is only a proposal, for anyone to
comment on or change.

1. Fixes could go to netdev as [PATCH net] with intel-wired-lan in Cc
   and be acked there by a maintainer listed for the driver, so they
   would not need a separate round on iwl-net.
2. Patches that are already queued could be sent again directly to net
   by the people who originally posted them, the same way.
3. Later, once this works for fixes, the same might be worth
   considering for net-next.

It would also help if Intel updated the MAINTAINERS entry to match and
kept it up to date, so that it is clear who acks fixes for each driver.
Jakub mentioned adding maintainers or splitting the entry, and the
details would be for Intel to decide.

Does anyone see a problem with this? And who can make the final call
on how to go on?

Regards,
Petr

