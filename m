Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934743;
	b=kEK7Hr2PE9VQDn7/IsvobmAiYYKerTTs8gazgsp5j4WM6vGd8k4YfubkyFVUb9ucmPcO
	 Ir4DOJ4ijksLszdutNLV2obwng5jqsfiTjyov6frAN7nASMvBrmRPLJlcBB/Xkt49yXJR
	 In1Fx6+0K5qSjJG2bmZx+7CUn+RmJysT4F15nZ0zO7Ae5q0hIRRRyT6e3Ag+pelEp0Poz
	 wRadXZsc46+bg63fVsO6C5k++ZL5mvzEZCasPqSACaXNW54EFOm2VWCcsILqCKY3Jkuz+
	 KnPHX5hozWMrWHcDguwg/IWoPGDiXWLIKgUnJrMNH14QXeCoP/NsZ14NctoDQ05xsfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934743;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=/sExmZ117jhWvHZ7v1Er7gDQc9fAtZqbDp3VfinKnpY=;
	b=AdCINgJQOGfeXcpiZMuimSYEpe0XbZwUhMOazF32oqFv11im7ob00tByFJvZGJk2ULG8
	 wtZE+QEzoIh5m+D2BfeJvFC/1+2Jqf09mi9LL4U5xK4DJD+0fWcT5wQ0oC+YCPNR0y75Z
	 jefxLjM65P5i2z8pgcsu6OZQmlHZFYA62wNOzRhG2zeYJHTC/yr16VALigP8tjLTV9qCf
	 wH8wjl5jsmN1vrwl4JQS5cw0jU6bifmK3m00Jn8LKc4noGLnf4oLlRXqLFpREv+DqBF4Y
	 aX0AdMqhECqzQI/I29GJ5qY81A9uEe31IyNpEqqgtGk2J0Lz6CTbEYXkoq9c40hga/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FboX1a6j;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0C606A32F
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA0C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=FboX1a6j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 661BF4E41591;
	Tue, 17 Nov 2026 16:59:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 165B55FDAD;
	Tue, 17 Nov 2026 16:59:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CE8411BC0067;
	Tue, 17 Nov 2026 17:58:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794934735; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=/sExmZ117jhWvHZ7v1Er7gDQc9fAtZqbDp3VfinKnpY=;
	b=FboX1a6jpgdrVKL/ht3sgG7t6f0D8SfPrcwbol6vq5wDpxPQY7SoQdJDc3YVK2fNTVju/G
	VCMTCUrTZfxjETxJRDUXpar/89Z8mFGrpJi5ht9qzSD5TUPQgoEORfBXq0UCJINqZYtda+
	Qm/AUiI60CfwXcDYhNzeWUSFjfYWcOZ5TmAfd+2+1/GquSDcIuEp/Te1WPwZnwlKT6dNoh
	6D5P8DyLWLhzN4vM1BzzVLQpmwQCcrKLQ5m+IkUeZQpCt3/oRNYJG2sUhGEWZkPSJoUayx
	nOin4yeYWx6FgE4wEe6ghfBlRh8DAnmJklmdQHaMPjDOOZLsIIJIpYXmzi95WQ==
Message-ID: <3bb32808-2c16-4bee-a593-4e7d10dd34b4@bootlin.com>
Date: Tue, 17 Nov 2026 17:58:49 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 4/7] net: stmmac: dwmac-meson8b: follow the generic
 RGMII delay rules on the T7
To: Lucas Tanure <tanure@linux.com>, xianwei.zhao@amlogic.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>
References: <20261113121852.334604-1-tanure@linux.com>
 <20261113121852.334604-5-tanure@linux.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20261113121852.334604-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

On 11/13/26 13:18, Lucas Tanure wrote:
> The delay code reads phy-mode as the list of delays this glue has to
> add, falls back to a 2ns transmit delay when no property asks for one,
> and takes the vendor delay properties. ethernet-controller.yaml says
> the opposite: the PHY adds the 2ns delays, and the MAC properties only
> hold small fine tuning added on top. Every board in the tree depends on
> the old reading, so it stays as it is.
> 
> No T7 board uses this glue yet, so the T7 gets a path of its own that
> follows the generic rules: the receive delay line is fine tuning in
> 200ps steps, and the transmit side, a quarter-period phase step, offers
> none, so the transmit property is refused.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

