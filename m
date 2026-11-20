Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795199942;
	b=iCjujALuy0Ee5ECrgpt+K9x7LZmmWfaQjz9fFgpGgdxEqpu3Yh8YXCcdGybk8wBalUos
	 sfRxwtXqpOCTlmhM8BduICKe0+dtW66JxTMjWF4XSZgGv0abMomCkOvg3JM8GERoTXYpv
	 Uj+OTlp4/xDvbdFCerdYgs+MsWcAHOCr/+fcaQ9FZOHwnPUHKtU0O43fbqX6/T5MbM2wY
	 3v9fJf1XN35JKZoIPSnDy/ptj8QPBbewJ12So2VK1OuF75g19fSrj98b/Ygal067tF7Nz
	 5SqeShF9SHNgux9p9hbWLr9IIoQg4LGJgB20pKegxQVuw5CTGMOa+xPS/ljXywNV/bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795199942;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 User-Agent:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=oQw3i108RPM5buC+p6pexeM+VTd16NElY2rsP3e1vco=;
	b=a05QOmicvfU9QoczphQEBuUrQJWQyaek7n4sNRPSBQPo7ytsICjrydudvsxwMGzQOhNh
	 KlzTXTUJPgV+mwcfP0uhGmYNyLCPbck+paif7VrLk0nKSqWrvJGsDmzzN9FxKJZKNnIpK
	 3lvP+LUg+u0WVyE+qTq5jbAYzlYqMjgyGdkg2OZk0AVjS96RchZ7bd2DWBKr77XAq6K41
	 5Mq2i3L4MBjkjg0tpJDZWDsxRzgYYXDb0jSry6Ffa9DZWZi0dqQUJnIGU0epBJKPQFS+h
	 hgT77pVF+zaXLba2LJRXrr3rc/+sgP+jp3EmSFSLVbVxDJbBPPiJnltt+rg3BY1cOBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mssh3ttm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E08606A339
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 18:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mssh3ttm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF621F000CF;
	Fri, 20 Nov 2026 18:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795199942;
	bh=oQw3i108RPM5buC+p6pexeM+VTd16NElY2rsP3e1vco=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=mssh3ttmd0MQsIES7sYsysAhOnNy1xTknXktxY2FEhrAxM0IKYCH1Mru0vw/f3mQR
	 gWJ85+IVe1KoimOsw+KeX9GErp+GVAG086+0dHn7sffdakpLtDPP8voeDMUS7GExhZ
	 7r0jOIVlYayOzXiyjNgXWw5juYyqzdmjuvv9CcwRNF+Ec6Fy+9bO7IrjzuadOqpBOb
	 8I/i2+6SbA6xdDqjtIN5tD5tGYqoTrPlr07pgKA1TZOEfslIUb+Ue7T1Hv1WVUinJX
	 kXM1FTQTpHeKUaXz4g1wvyp3G+DobS/TrqUquBP1S/Qxcd1tmCeZNA36+NJQKJeFB8
	 6KL0nr4RJRm5A==
From: Roman Gushchin <roman@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>,  Roman Gushchin
 <roman.gushchin@linux.dev>,  Hans Ulli Kroll <ulli.kroll@googlemail.com>,
  Andrew Lunn <andrew+netdev@lunn.ch>,  "David S. Miller"
 <davem@davemloft.net>,  Paolo Abeni <pabeni@redhat.com>,  =?utf-8?Q?Micha?=
 =?utf-8?Q?=C5=82_Miros=C5=82aw?=
 <mirq-linux@rere.qmqm.pl>,  Myeonghun Pak <mhun512@gmail.com>,  Eric
 Dumazet <edumazet@kernel.org>,  netdev@vger.kernel.org
Subject: Re: [PATCH net-next v8 00/19] net: ethernet: cortina: Fix Gemini
 RX/TX buffer management
In-Reply-To: <CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
References: <20261112-gemini-ethernet-fixes-3-v8-0-f55bd43e02d3@kernel.org>
	<CAD++jL=BZYKywoLY7rqh6+j5X1jpjXBA0OdDAJ-DCaqYMZoVjQ@mail.gmail.com>
	<20261119165240.293dfbd6@kernel.org>
	<CAD++jLnP2EfgM_isbdmidLOc0ZUaoq+bgD+cvw9sKLJCynniWw@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 31.1
Date: Fri, 20 Nov 2026 10:39:00 -0800
Message-ID: <87pkvzfiuz.fsf@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> writes:

> On Fri, Nov 20, 2026 at 1:52=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> =
wrote:
>
>> > I think it could be applied and then maybe I can follow up some
>> > of the comments later once this is landed and the ethernet is
>> > working properly.
>>
>> Ugh, not only is this pile over 15 patches
>
> I blame that on Sashiko's constant "oh by the way fix this too"
> and ability to find otherworldly error paths...
>
>> it also fell victim to the
>> mass rename of kmalloc to kmalloc_obj that landed in Linus's tree :/
>
> Oh Christ :D
>
>> Please:
>>  - rebase
>>  - drop all the Fixes tags here, net-next =3D=3D no Fixes tags
>
> NB: the Sashiko used by netdev insists on us adding these so we
> are giving incoherent messages here. Clearly Sashiko can see
> the prefix on each series and know whether Fixes: are applicable
> or not. We need to fix the Sashiko
> prompts. (I can perhaps do it if I know how, Roman?)
>
> Sometimes Fixes: are used for "nonurgent fixes" in other kernel
> trees but maybe it just doesn't work with netdev.

A clearly written text with rules in English would work, I can do the
rest. But it's for "upstream" Sashiko, netdev-specific Sashiko is
supported by Jakub and has quite significantly diverged.
