Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795567185;
	b=KLG3M/18fO8kE4sic/bB8EDvLyLCvnt5ijk7Yjt2rJSCkC6MMxjXaXtF29KeJkHaZNBg
	 q5P2XBAg/bbdVqT42I1kICPSq4QFFkbvCpSoaq77VE8Z5l3OxpR0gbAzZLT9P1HxMfLYM
	 Bjf5qv40O2WtrqC30TRdiiRVb9S5HA4nynMQT0QeCCi7XZd0T5oOewWrtfMnLEDq20AL1
	 NyyJ/TWkdedA3m0qp0O7JMCJ8z20G1KcDyBF/v5u7vcusBUmR6yVIak/E92q40vKfLVis
	 QerLQbERErl2sLRnVMQeBr7kuf/BTHD2hBbce4UID4x81eH/yBhq+3I3TgZtyQc72XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795567185;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=ddifEJUsVQ/3k7zg20+LhtIcVvTSta6RtHRdIXEKLp4=;
	b=BBn8SjZDGKDDKJSM/tm3p8avdVABEjz4FFsZevnFPhDHUb3NXLSHcXdoIAvrQPSiI71j
	 sLB2fcyegl+wNuxH0TTHIxYwyvKOyE5v7mQhuFMxF+z/N8VM2OQdrZKSMaJkA5yTra36f
	 O3mu0WcUojSD3MDqWgoWq0tWc5SVq7q6zj7UrN7r5HP85ILb2wDo2ISUCAvNqZ5q+Vp9i
	 QFKQ/OzV8IAxHEkrW1y4FLVF0ST9xUQCfTd9SaGfZR97EscwPF74gWyFBrwD/Sgh9dax2
	 uUsSYvmuv+V/gEPyrZEHayhF9IoRRgAGEkNPVjhTc/KN+Awj8c/QRX2pRsleORrupvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YfcHIhAF;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D74606A321;
	Wed, 25 Nov 2026 00:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33D74606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=YfcHIhAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1795567176;
	bh=ddifEJUsVQ/3k7zg20+LhtIcVvTSta6RtHRdIXEKLp4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=YfcHIhAFS+V9xD/DxHFPBg3q52jU1s8sm/dpBo0DUGAPk4KTeRkfl7VSW6NDS+9CV
	 qidG+M1pcl4ZZnnBgyAORSPE9nxYz2MYuiuj3G+mp4OJptuxgh3TeYr2u+mOFdrGxs
	 jO2OMhbqeTlwAmcJJQIndHGFbthNc6kro/G3pJ/IZkzZFQ5UMsZVDvabFRvmj22tSn
	 lpdbx0p3Z5izXhz9bX+iVeGzeXsajIJHWAkDJKURSUPDUbvdhOKY8vgP39CQroV3R2
	 CEfryR7lI4y54h9XFKD+hYeGOq8kRqKbHETt2YyDpyeCS7tbYaTjWk1DMK6bYpINCV
	 PwPJVMXEYZJtQ==
Received: from pecola.lan (unknown [159.196.93.152])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D0B8B60895;
	Wed, 25 Nov 2026 08:39:35 +0800 (AWST)
Message-ID: <554f3a558a73c9984ec7d3395aa53aefc91d8a36.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/3] net: mctp i3c: clamp transfer lengths to the
 controller limits
From: Jeremy Kerr <jk@codeconstruct.com.au>
To: Shubham Patil <shubhamsanjay.patil@amd.com>, Alexandre Belloni
	 <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>
Cc: Matt Johnston <matt@codeconstruct.com.au>,
 linux-i3c@lists.infradead.org, 	netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, 	meaganlloyd@linux.microsoft.com, git@amd.com
Date: Wed, 25 Nov 2026 08:39:35 +0800
In-Reply-To: <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
References: <20261124060651.1987454-1-shubhamsanjay.patil@amd.com>
	 <20261124060651.1987454-4-shubhamsanjay.patil@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Shubham,

> mctp_i3c_setup() takes the maximum read and write lengths straight from
> GETMRL and GETMWL. Those describe the endpoint alone, so on a controller
> with a smaller limit every read can be built too large and rejected.
> Transmit packets can similarly reach the controller even when they are
> larger than its transmit buffer. The receive path also allocates an skb
> for data the hardware can never deliver.
>=20
> Use i3c_device_get_max_read_xfer_bytes() and
> i3c_device_get_max_write_xfer_bytes() instead, which return the smaller
> of the endpoint and controller limits.
>=20
> Behaviour is unchanged when neither reports a limit, as the helpers
> return 0 exactly as the GETMRL and GETMWL fields do today.
>=20
> Signed-off-by: Shubham Patil <shubhamsanjay.patil@amd.com>

Looks good, thanks!

For the MCTP side of things:

Reviewed-by: Jeremy Kerr <jk@codeconstruct.com.au>

Since this depends on the new i3c helpers, which (I assume) would be
going through the i3c tree, I assume the whole series should stay
together?

Cheers,


Jeremy
