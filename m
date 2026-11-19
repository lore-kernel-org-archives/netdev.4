Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795066959;
	b=C8FZ1U8rbyz6UlBf/5IZFn1WIBYzULgCfCjcG1BoEit05gcOJSNpyMXhj/hC10sLFnld
	 DGfIBT7yOjFVzUk2Kq231pP9nnB2oGakCcecaQT9yviN1aBytFWAGRf8hsMvQwJwHFP+3
	 uJrhci8+PbSgdg3KgdU2J/yY69sbHAIQHJUU0b+NVTV++EJL6eksstfYJj9EkpqHQtlZR
	 VP6TqWQ8P1Y6E+tDzWx/gyBTIwY5OKQIdjLr5LIcvOsTURd/vE08506ks46/67Zb8TjNL
	 f/hB4WJwCzWT9BQVR5j5eKNiCdOWTEeP0C0bk2tDdiP3oeZgwU5GSo2RTP69N1k5Lkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795066959;
	h=DMARC-Filter:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-CM-TRANSID:
	 X-Coremail-Antispam:X-CM-SenderInfo;
	bh=TfyqN5N0HsajAx60aXm/mbdtsX+mZmkQNjwbhKW+JR0=;
	b=NsSLUTsTlIvS8gf77BPakE/JMi7MP7oOZ+Lyj5u+PrXOhdiO/efwqIVc0JZTcMZbLRDc
	 2pPdU8ozYi5DNAzgPouTKRUv4PO84raZioqJzeMuVGx8riqSXlWey4HYHrPvt1wpUXtwS
	 ieDKXe1ta+BZPVbgbA770sk0Y3dBlwJ7pPXNZ2zeDyquWQmnHTiMyjrhCbyjzJRw63g3J
	 dqXCknoqPEM89ftcxt2bT/P5dP1aPiur160O3Bdr7SX+NOXEdBt0JjK+c5N8iZ4yrJy4t
	 H5wpd/RDCaLOsJYk0gmSBxfGsW7Fa7ssjyENGMuwILLn0/czXWD00wDOyElL6Yh/g+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=T3FKh4WF;
	arc=none smtp.remote-ip=220.197.31.2
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8287A606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 05:42:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8287A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=T3FKh4WF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=TfyqN5N0HsajAx60aXm/mbdtsX+mZmkQNjwbhKW+JR0=;
	b=T3FKh4WFvI7H5u7ek9m0vYPmPEw9lqFBU7e2H0uFg+KN4F/3YBXTLvRvUzFZ6N
	XhQCfHQKSowN5aRezi9ut08J7VVn17gVUc30LKGgMemJtVOQiRG9zh0coYukojOH
	7KAyuC6E4jS2o0unfHgj2oWID7BWtyOwJY8zEaygcFVQ4=
Message-ID: <90640d84-0c13-4004-b3df-1a11e4321fae@163.com>
Date: Thu, 19 Nov 2026 13:42:05 +0800
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
Content-Language: en-US
From: Rongguang Wei <clementwei90@163.com>
In-Reply-To: <DMYVOCRSECAR.1WZZONX4K3PYF@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:_____wDnD6YtjP5qkk2uIg--.7948S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUeWlkDUUUU
X-CM-SenderInfo: 5fohzv5qwzvxizq6il2tof0z/xtbC4g+I82r+jC+WqQAA3e



Alexei Starovoitov wrote:
> On Wed, Nov 18, 2026 at 07:22 PM Rongguang Wei <clementwei90@163.com> wrote:
>>  drivers/net/tun.c | 93 ++++++++++++++++++++++-------------------------
>>  1 file changed, 43 insertions(+), 50 deletions(-)
> 
> Why did you lose removal of exports?
> The changelog doesn't say why.
> 
> pw-bot: cr
Hi,

I see the export removal as a separate cleanup rather than part of this fix.
This series is a -net fix with a Fixes: tag, so I think it should send the removal
separately.

Sorry for lost in changelog.

