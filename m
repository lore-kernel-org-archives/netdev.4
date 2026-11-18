Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003175;
	b=rpihaSdANAoTLw+xAeUG4mmNsOA3AIMMAOCYBLXiKOAObrItRxQgrtKUnVwO+PDMkzTP
	 uVFt3kZqFxNumRT7BmkG1wDQoKtCFqRoCgRitZbjbKtmaBH8GX/2CV9sqvK1sq116G/CZ
	 Qq0EK4b4hbj0SNsaS5YpYYsHkwBcYIpfTkxzqqqtXH35eUuKEDgOLyUosiwn0B005ZygB
	 G3cuefcGFQNHhaa2wdQeNm/GQeUmvALb9TDA00Srdggyut1LLx28gZLr4nEMRMRLGrxuE
	 Ee0jCew8s4X/2St/CcyxWgo5w3wNn3mLtoeN2EaeFlnogcad2T3bifKLnpqxbCcicLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003175;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=2dDyleRAjZnoOMRs+CNNW7qYSeHY98cpTcJ7uqL70PY=;
	b=mhgXUZMXqfeYDWcKpIocTaNOJhs92TPMO+wH4MbKbfDoHbgn7NFbRFEBmv9QG3p+xe9n
	 kKDeqMMvQk6j8v2qg3jssldel4RXLCblJWGBHXD7fSKAiDhWoBDVu4rJZehiUjcoI89xn
	 aGiEANh4P4eapEX2zu+jIRQrL7ydV3yJ/RLGqviFrSaptbUjh5frxr1IlWe/Mxh5CJbq+
	 Rwyo9ELkFJsvbZ8WBMzmZe13oDyvN/YReFbl4XdwEu0iXwYkNJMlYlklYvNAl29bCZA1d
	 Tg0wCRFp695jWN5Rmh2PFBlg7Im5Ek2sSxxfFoLJBtl0tGRwIvzY40vLnBrosdR4NTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bLMUfFmv;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAAA60A2605
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 11:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABAAA60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bLMUfFmv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795003174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2dDyleRAjZnoOMRs+CNNW7qYSeHY98cpTcJ7uqL70PY=;
	b=bLMUfFmv8etF0wQZIc5E2vFod6H/vwVMnG6BDD8huoGZVj0K3hOn37Awu7ctTtJ7LT6usM
	Epg0R0fST4UhX3F7irDxDZ8zbVzitKZdBOsR4moIYAGGyz13wFc61ZAWxfYRog/G7vQdsg
	qFgDe9QI117BsDnib/PzjXLK+aO9FgA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-33-A9drWmzQOaWLx45IHVKftw-1; Wed,
 18 Nov 2026 11:59:30 +0000
X-MC-Unique: A9drWmzQOaWLx45IHVKftw-1
X-Mimecast-MFC-AGG-ID: A9drWmzQOaWLx45IHVKftw_1795003168
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4EA31956057;
	Wed, 18 Nov 2026 11:59:27 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 48C26195B3C2;
	Wed, 18 Nov 2026 11:59:22 +0000 (UTC)
From: Petr Oros <poros@redhat.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>
Cc: Petr Oros <poros@redhat.com>,
	netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	edumazet@kernel.org,
	davem@davemloft.net,
	andrew+netdev@lunn.ch,
	horms@kernel.org,
	Jacob Keller <jacob.e.keller@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Marcin Szycik <marcin.szycik@linux.intel.com>,
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>,
	intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates 2026-11-13 (ice)
Date: Wed, 18 Nov 2026 12:59:13 +0100
Message-ID: <20261118115915.116177-1-poros@redhat.com>
In-Reply-To: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com>
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

I think this pull is a good moment to ask how fixes for Intel drivers
should flow, because it is not the first time a fix spent months on
intel-wired-lan and then hit a wall on net.

My patches 2/6 and 3/6 have been on intel-wired-lan since June, v4 on
July 8 [1]. They were reviewed and tested by Intel validation there,
and four months later Sashiko found real problems in them on this
pull. I have a v5 and will send it once it is tested.

Jake's E82x timestamp fixes went through three pulls before a part of
them was applied [2], and Maciej described the same loop on the i40e
pull in September [3].

I know Intel patches go through iwl and are not applied to net
directly [4]. But for fixes it means that the review which decides
happens on netdev months after the iwl review and validation, and every
respin goes through both again. And if iwl stops cross-posting to
netdev, as Jakub suggested [5], Sashiko will see Intel fixes only in
the pull.

So does the iwl round still make sense for fixes? Would it be better to
send fixes straight to net with iwl in Cc, and have Tony's ack and the
Tested-by from Intel validation on netdev?

[1] https://lore.kernel.org/all/20260708125755.706263-1-poros@redhat.com/
[2] https://lore.kernel.org/all/20261021-jk-e825c-timestamp-processing-logic-fixes-srcu-v5-0-72289a4ac8eb@intel.com/
[3] https://lore.kernel.org/all/are4rBUJO3mzrkO8@boxer/
[4] https://lore.kernel.org/all/20260721174642.7749143e@kernel.org/
[5] https://lore.kernel.org/all/20260922112216.41e6f8cf@kernel.org/

Regards,
Petr

