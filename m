Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795572964;
	b=lZ36wopKGcMk32a5uPNQdWXbhkcj1O0bjD28nJxZTLpqwa/JwsNbDVBwdIH96wFtOAJI
	 0pUI/Z/rvaaeJkwT8htMExJSZmaO2+nW0OFjrVf7Aw7ewFSMJ9hblmh9qAryIxuO074vr
	 SPODgAIXEUtYdG0Cbp6wGBIlrlkmW0T+w0paLkkq4ypAV51E4gRjhrA/ui3EQKj8zLyCB
	 tFyvGg4mPx6NdwXeXJWdYWJgzgq92th5zG5mxyhyTGtCtWFx4L/Mgsl+q/VFdCkvbod2v
	 SX+ZF4BZPjNPjhHL2hSpxKH8OxBJYMWrf6z27/YXY6w+gHpgy6NtMODTpehq8jFjDig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795572964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SKdX/4ts59TqNFqp6oSuO+kPauF+oBKV3Bfr/GI4g+w=;
	b=fcr25Rfz8xM/pMym0BkIp/jdRTzW9rHYPI6DkGDypeCZfR/ud/B0+VCFrzIp9K0F8mGO
	 QoSMrKqJxvHESAmItshwwDbfMhFXiteczl5sdY+Ujmt5goTf9XhFD11ZTLRk0LB7RVmVK
	 39qcVvKnfnckCZFEeRhUbxUeZodsPokAYZQ8Z0Dxm+g4f30qFttVQthDrFOsPijZxdMs5
	 74Yz/YvO6f5c9N2YFs85T+z59kFlI/jwc6ZNYFhwymvDIcTt1wMbp7v8IGjrsvCPFh8hA
	 XVESqfN9ZWKUV/h2/OVT/RwhdRBbJkA/3+v0gE0xlOCgs4F0FKOlN3Evet+vhDp9/Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=as7Xegju;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFFC2606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 02:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFFC2606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=as7Xegju
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so311785166b.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 18:16:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795572962; cv=none;
        d=google.com; s=arc-20260327;
        b=a2qgJyMfaAuV6Z6kO0gNevrU4IEl5YLRWB+0uI+ODs8i3D6wZ2FrWTnLPT3jwmg0bz
         qdI3u+l7usJh0/u7oDDFebTMN14ArrA9nFZzeq/jni1eWfrou9HlDh5WZbdPHOt0QiaS
         4hXllur4UwRIanjAuoDzi1kkrXsUNCrXsy9q+/fVfSCIrO7YDYnKHDOH6mX7vG747doL
         P0DaOeM+1oZGYUOkExTPgCrwSBtBPZvBEB6MN33FSEKZRnDl2+iC19fSXn729padZLaE
         M9X+EYsuX9q5jif42ILi+t9A1TwgkW1JnztsHWTSMZvbxDc2PxNLT1kLPe5XiJq8+YWT
         2KpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SKdX/4ts59TqNFqp6oSuO+kPauF+oBKV3Bfr/GI4g+w=;
        fh=1aYEGjLq7d27rXFzQJPGFDOFo/5pggIZ9d9L8YejjjE=;
        b=igvecLKn4M78LAaJu2Kqeag2Ob/+hX/7Ov5LOcGbDrRqwLWXUe4FczxrX+6SD90dzg
         9J6ypZEXuEDPD/ZP+PVLGFvPEUZkPcrLoEkPj7TsYDFQY8L2gI5K9rZhvyW51rV/U36W
         vPZldUVY2r+cz7twSuVyuxnUMiYIhy75unynyZ6Nf/YJED6tPbUrup0IjNX9AjbI3Yry
         9yG6k5rvYkGsnW0ZtkxTgTF/CYIzicMuDkmPJFeardEMUiRzjsIb1X0tC01POtDAgTPi
         A7tOVBVVRVjtDF8BwFhMBwK7qjBPHl1owuHQ+YTVh5aI4riqaJMQVI3EuOdzFUVvrnwL
         aGPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795572962; x=1796177762; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SKdX/4ts59TqNFqp6oSuO+kPauF+oBKV3Bfr/GI4g+w=;
        b=as7XegjuVfHHr7mX/aSTCjGbYsIqa1CTFsuT32wxzB1rP6LmEgvY5zYJBvlXm+H/vu
         pWlCwDLKARPOPPSCti3PljH3g/uz3LRLZaFoO5w3laYYjqg9qZqYZYN+6ZHgy78jujeG
         VRtECxhrZ8F2kLfbVzhsbziuujANVmDcrsiIIStK46UwEoVm/kMYcy+cLyy30sE7VAoK
         BA6o7pquruBogul9yhTTHbZsH8bUnzN+Iyz8CJiNUSqZxEVqH+vR+RaREGmzka09QcDb
         ynEfVQcKzt612NcS0UP8YwyZVDCmPM5SyrI6hI2llAl3sD/RYcgDUMi5Gn3QRu36Z0E5
         ZPDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795572962; x=1796177762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKdX/4ts59TqNFqp6oSuO+kPauF+oBKV3Bfr/GI4g+w=;
        b=MHjFYqA0rl2bDK08zqFZj8zG1HTRzU7qsctqg4EPCdDCxZCi4dshfWlP/KtT0aok0L
         Wi/zXj0n1LEHBsKaUTovyAoPrd/UzV/zfppPL9J02giJCjCdaTFuPkoHJxsogq4OUuAc
         2ixy/sjvXjmhRJheUbOyNbvbTJj0jvIft6bt9/bydBfiwFsSyO64mT9ku7IU1nZQSmUs
         aLdANEvr/S8fYodNFEvoFtfx3A628B26cFMMLhzJbHcgwIuvvOBarrPqv4cvKuqMzA43
         GEU90019B8H7mZ+spbPJOvBV2Bi+yLKP0+KQHtalKdS+eMuQ7UqxJjr+x3iTwGuLHkQb
         9x2Q==
X-Gm-Message-State: APuU4Z8/qVCbooT5MGBs/MboHrsJLLhB+DGViI7WjqtVKE1hHFmEAWvw
	pSa4Tp60pdPZ5sQop0KpC54iWvZVu7VfPtn0ofT2qjWt83UYRaP3vEgndqi5VJ7cEr57wf2wWrH
	w5gbnVtHF2EWvu2TFNGUaQui4cpY64eainY2e
X-Gm-Gg: AZFdTZeyfLLRwhdalK2TTKwzWYbD1NJjryaGJ57DXtOWoovJ3A/dpGpCe+ukdMGh8lU
	yHzP4enUJ0Er3HcUOB6YIdkxrBuTsFDvWNfVe4sOwsNE434SWgaq9f60NQJSwhJm2cJIzrN32XA
	WcRCB/CACYRpNYO+b5iQ3dNHbROhWKLIIMvOYhYvvYxWEt+HvLtbdTOBC5EgFKDUblKp+rh492q
	538yBUIbuboH+REN11RadWT171YZvW/wltTMmAMz7DAVXh2AzPMorpR+tdtCEEXJ43m2Rm1tDZV
	TaGJF3ZI1Woh1v7ZjqX7qGBFC5CNEvSsuQFqBfqtSFDN6yqff8nLT6AYohipmzn+dBL/7gd3we7
	utxPOKQSHQH0isFXQLyLVBafX5wG7U0T9Cb66Y01IoaOgxHigw5WTETRv6v2u7IJV8ozA9xI3G7
	ZoMHIvz16X3Z3nK3+aibwUkLRRKjwFFVvjmh66bWpiK85ADrOMy+co+vDmXVDRfiwBod7drH4ld
	6uIz/fyUm2oMN0=
X-Received: by 2002:a17:907:e11a:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c513aac21bemr942231866b.18.1795572962272; Tue, 24 Nov 2026
 18:16:02 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261124060139.3393511-1-dave.seddon.ca@gmail.com> <20261124165329.4dc7e4e7@phoenix.local>
In-Reply-To: <20261124165329.4dc7e4e7@phoenix.local>
From: dave seddon <dave.seddon.ca@gmail.com>
Date: Tue, 24 Nov 2026 18:15:51 -0800
X-Gm-Features: Aa3M54oyqhUm_vkNVWNXl2RMVxpU5-CK2iNAb03MO-fCl6lmyGnB42QiQHc0MOw
Message-ID: <CANypexRfRG1b8eXG+g9bnuzkaqV=8kPmnNO2uVT3+fB_UxCfNg@mail.gmail.com>
Subject: Re: [PATCH iproute2] ip xfrm: copy only the mark payload in deleteall
To: Stephen Hemminger <stephen@networkplumber.org>
Cc: netdev@vger.kernel.org, David Ahern <dsahern@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Stephen

The cast came in via 0c7d651b38d6 ("xfrm_{state, policy}: Allow to
deleteall polices/states
with marks") from 2017

I didn't touch the cast, and only fixed the one incorrect argument.

I've been trying to keep these patches as small as possible, but I'm
happy to tidy the surrounding code as well where that's preferred.

Would you prefer a new v2 version, or a follow up removing the cast?

I'll also drop the LLM lines going forward.

... I have quite a few more issues to submit

Thanks,
Dave

On Tue, Nov 24, 2026 at 4:53=E2=80=AFPM Stephen Hemminger
<stephen@networkplumber.org> wrote:
>
> On Mon, 23 Nov 2026 22:01:39 -0800
> Dave Seddon <dave.seddon.ca@gmail.com> wrote:
>
> > diff --git a/ip/xfrm_policy.c b/ip/xfrm_policy.c
> > index 5261a292..1a41f2a9 100644
> > --- a/ip/xfrm_policy.c
> > +++ b/ip/xfrm_policy.c
> > @@ -783,7 +783,7 @@ static int xfrm_policy_keep(struct nlmsghdr *n, voi=
d *arg)
> >
> >       if (tb[XFRMA_MARK]) {
> >               int r =3D addattr_l(new_n, xb->size, XFRMA_MARK,
> > -                             (void *)RTA_DATA(tb[XFRMA_MARK]), tb[XFRM=
A_MARK]->rta_len);
> > +                             (void *)RTA_DATA(tb[XFRMA_MARK]), RTA_PAY=
LOAD(tb[XFRMA_MARK]));
>
> Why the cast to void * here?  RTA_DATA() already is macro that returns vo=
id *
> and if it was a similar pointer (like char *) then C would do implicit co=
nversion.



--=20
Regards,
Dave Seddon
+1 415 857 5102
