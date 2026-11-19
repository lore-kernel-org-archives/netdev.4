Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795071112;
	b=SLMy5uunwdkMTBpLPW69Brbkqy5X2DbuE9p6XKOgWOcQp0+uzrxC7P5HH3S/6CF/9IKN
	 Kj7kD+pg5JRYLbOQQSAzgFy2eyUYJ8mPulmnn7abEsbKMFsG+d+720XL27OqcFL7rgSwt
	 sOeiFNGnX6+AeIAS+y+PydNv4AlxeCXZ46Jfg2fREK4lNg0kCoA16pI22+N1Cr706DD/k
	 qpmsejsOzqUY6VSYAIgslomETJ7heAx29PLjE1OAGIoApOvv0JOAq1JDwtwJTgYyNY9Tp
	 QPD/KT5c0b2CjFxqgRXT+IgcPwxFUnwtFT+/9mjlKv0dickHoEaneu+8yKMsaTaUNXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795071112;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=1+LEKhzpa2ZJS0hgVo+/Bamkeu8z0vuukdxuNRiKJlg=;
	b=0PGJqTzCV6yfytYNBEGlw0Oxdz9qihCqg4LzVawsXSn4qOTKCeQcUnCPqVis3A3WHxrk
	 rfPzGd/lbQTyNcOSWf2VHfBgYj1jj3tB7HBuwFU/ZdLmuepfwa7QsPX8rgXA+buiM8AsQ
	 G8glT9ZgcYqQM7H8DtJ202h/M44INBKxyI6FI2oF2YZGqbysQqV0dWYV9K9IfSIpj/y+a
	 n5WExifBMCCi7xkYmxhusHtciqUo0CMAQ9ouwrKUHRlsZZ9lfe7KjIWV3SIJMAH6T6wuC
	 KBlHNdSS+Vdn6MfUgJ7pX37ue+gNe6GoOLiiKBGInnBae+i59sGXlVvrqil22B8g8ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AvWORjUf;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E322606A324
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 06:51:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E322606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=AvWORjUf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=1+LEKhzpa2ZJS0hgVo+/Bamkeu8z0vuukdxuNRiKJlg=;
	b=AvWORjUfaXo0VgqXrC7C7QrwMC1ToVmGOPRcNYAa1T7e8sUE+lFNt0STkmd+xa
	afTDo0KN2jVbGq4owP23724PidR7XlkROvUY9an1g5XlCZ/mS6s6Jd65b0vm/G4Z
	mYwjafJviojzKmmWsS8SyZzh1YqI0iXYTepVARRIl2XRQ=
Message-ID: <a77a862e-6e49-4887-b274-1ddaea9d2fc2@163.com>
Date: Thu, 19 Nov 2026 14:51:17 +0800
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
Subject: Re: [PATCH net v11 1/2] tun: run the socket filter from
 tun_net_xmit()
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>, netdev@vger.kernel.org
Cc: willemdebruijn.kernel@gmail.com, jasowangio@gmail.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 Rongguang Wei <weirongguang@kylinos.cn>
References: <20261119032242.71919-1-clementwei90@163.com>
 <20261119032242.71919-2-clementwei90@163.com>
 <DMYVOCRSECAR.1WZZONX4K3PYF@gmail.com>
 <90640d84-0c13-4004-b3df-1a11e4321fae@163.com>
 <DMYYW8MYVIHB.3D78GEWAD6OSX@gmail.com>
Content-Language: en-US
From: Rongguang Wei <clementwei90@163.com>
In-Reply-To: <DMYYW8MYVIHB.3D78GEWAD6OSX@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wD3v7xlnP5qRfZOJQ--.53068S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeWlkDUUUU
X-CM-SenderInfo: 5fohzv5qwzvxizq6il2tof0z/xtbC4QaaBmr+nGZkmwAA3q



Alexei Starovoitov wrote:
> On Wed, Nov 18, 2026 at 09:42 PM Rongguang Wei <clementwei90@163.com> wrote:
>> I see the export removal as a separate cleanup rather than part of this fix.
>> This series is a -net fix with a Fixes: tag, so I think it should send the removal
>> separately.
> 
> Disagree.
> The two exports exist for tun only.
> This patch removes the last caller in a module.
OK.
I'll add it back and fold it into patch 1.

