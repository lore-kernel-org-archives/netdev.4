Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795686254;
	b=lCEpvod7rOJHydMkQBn7v6vUwEwxJZiYilptVktjccAguW99s93kZH5MWdDQy61cyXhu
	 JpGue9CufgLtKym6yYlB2agmve1VmtxDqWkdHS8SAYqglLXxme1lzV3QGtJxc4q/ivFDL
	 ZC/43TZgUCDnqGBLbpnrrRNMCL2HOILN15dEm7blOKDzFhiRttCNPiHd2iu6WogXzGPOn
	 MU85wUgVPyn9Z7q/Y3ofQARfSOdEMwOwETpUrTuzJxV2+7uVTaIM2ExkUj4G5m7w2GcFK
	 HMckD+9PnVYu0KmZbPNfhd8skIsIGgiTUrmskaA4aqmqtA89G1Ixse0g1PzW8f2NYbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795686254;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=g078Dy1fEm9x/sL5Ls7eBVvcf1IS50HzrnCc2rOfeeQ=;
	b=JTZuM9jGoogaUHs4EQntuX2PF8PQ1gKFg1hBzwfW8JFASWPNWTANaPLFcxZBGHHc7vYQ
	 zB0YzVkN20fElKXKlp8iCl5poIuYNzMdzxfe23fXPUDENqvX4/do02SoKi3ldl9d7FZRZ
	 E+oPK78/rVkMRqIU2DbogKCR+R0xxtwtRRfQWd4uyxnGCaPCkvlf4fgFhNIpevGKljIy2
	 cKwW/S1YhRno8NRU//L6q6DdqfSaiZJj39lbBhzHqVQZ9ByZZTL9GwdRl20hd7zd5aPa3
	 We+wp5+xhFYAihFseEbEa32J/EPp0KtKQPOfd44upUHvNU6elcYSvcj2uVw/AM8uaBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzJB1H4R;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84817606A680
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84817606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=hzJB1H4R
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795686252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g078Dy1fEm9x/sL5Ls7eBVvcf1IS50HzrnCc2rOfeeQ=;
	b=hzJB1H4R7620QyefdDN6OyZl8U+P5OlNdbF4E7mMcwMDUawtYC2iKIYkDGpN/68QF2HekR
	ZGAanHTf6pvT2b6ERsdQ2E76Bl3m0Bjcvc32dg77Km0qdIQdrCz6BDRPeAW9OxQpz0RqYk
	P33zluImnbA/c2ML5vqbLwHArwvrj6w=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-532-skD1vfObPF2ZmZy9ESyMUQ-1; Thu,
 26 Nov 2026 09:44:07 +0000
X-MC-Unique: skD1vfObPF2ZmZy9ESyMUQ-1
X-Mimecast-MFC-AGG-ID: skD1vfObPF2ZmZy9ESyMUQ_1795686245
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A2AC519560B3;
	Thu, 26 Nov 2026 09:44:04 +0000 (UTC)
Received: from poros-thinkpadp16vgen1.tpbc.com (unknown [10.44.48.12])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 150E83000229;
	Thu, 26 Nov 2026 09:43:59 +0000 (UTC)
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
	brett.creeley@amd.com,
	Matthieu Baerts <matttbe@kernel.org>
Subject: Re: [PATCH net-next v7 00/15] devlink, mlx5, iavf, ice: XLVF for iavf
Date: Thu, 26 Nov 2026 10:43:56 +0100
Message-ID: <20261126094357.40243-1-poros@redhat.com>
In-Reply-To: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
References: <20261121230123.316391-1-przemyslaw.kitszel@intel.com>
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

On Sat, 21 Nov 2026 23:55:27 +0100, Przemek Kitszel wrote:
> The purpose of this series is to allow iavf to use more than 16 queue
> pairs, in two modes: up to 64 and up to 256 queue pairs.

I tested v7 on an E810-C, on top of 720a6f58c0ba with KASAN and lockdep,
and compared it with that commit alone.

Both modes work. A VF gets 64 queues with a global LUT and 256 with the
PF LUT, traffic lands on the queues that the table points at, and user
tables survive resets on the PF and in iavf. An iavf built from the
parent commit stays at 16 queues, and the divide by zero from v5 is
gone.

Three things break, reproducers and the comparison with the parent are
in my replies to 15/15 and 06/15. A VF LUT change followed by a write to
sriov_vf_msix_count crashes, creating VFs while mqprio channel mode is
being set up deadlocks, and an "ethtool -L" on the PF that finds no
contiguous queue range oopses with rtnl held. Sashiko asked about the
first two.

The selftests I ran from drivers/net and drivers/net/hw show no new
failure with the series, rss_api.py included.

Regards,
Petr

