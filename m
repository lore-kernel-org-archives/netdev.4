Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795626748;
	b=MONj5avCWqZL+bYYBC/bdYazaZ+Em9b3sUhUXB9vUIbnDBou/2y5quq4nI1ljuoUP2N/
	 CeLIIokAyDjUrprnGd5idQjF+zFQNrEcacqlpNhaa0k/pJbwAd8o1wsIlW+OJiRnNxQJX
	 fDJ10wjSZhC6PSs1doxq7JMTYrqGbKHfdp3lezhdoDKOhp5kms6fSSa1TPYKztwYld7Xm
	 uhgMLyTk7OCwCxxUZozOrS7EYGICv20Alvr3F8FzBpsEIdO/dVHvuRmxgemPX3+kbNVBc
	 TaV5X9+9OistyCdwsHUqF/Bej2H8qxu+lc6xGaXYrjTLhz2jZlUedI/nHeZgsWEWCjw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795626748;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0ECBJQL8Vh8RvECNcJ1CF1oSG2EUEVKrzykxBdK9hDQ=;
	b=Iz9R5uI+dJeq6/94DH2bKel2imZCdL6TGzVteKQ+IugHqjV+zw0Rsk2fAVC2EBp2LO2k
	 oKScYHnGiYYA++dpd31i5bfF4GXLnSN2k1zHz7P5JEJ3FwVlQx3ZH1VBKgJnJ4icNo7ZV
	 yxMA728RFaF8V2TA6dRJt/7rkxnB3vRtzvy9/1wc/gfk0D736/D3bMV0iCHNrFuByKZ8R
	 9e3XdJ+68qZJYuB0hnePHDWEynmoIT8hofpLVVY7/0PwJE4LKcCANj/DApHpsEu1yMAiq
	 yPFBoJApDdjKaPT/FO9vtSB7megJEHCO52BvN1ZQkk4nNJ6mK2A/wu1of7zB+xqFd3g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocD9F2gJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9984F606A339
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 17:12:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9984F606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ocD9F2gJ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so5614221f8f.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:12:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795626745; cv=none;
        d=google.com; s=arc-20260327;
        b=UhMSROFdxD/uNdzeAXhbwWQ8/5to7aHjQxNlIgZEttK/jV3L3z1MjMWB7MJJPeCa/0
         L3EcS5jXgBLKcUiUSdj1DKs5PeL3unY44yk2mlP00Z+gKQ/hWQWfAHrtSzL89VaEPtBR
         epppKt6c7HefvG+dyytIsM765AuD8lpeBpTeexUv+bPZqvp1J11cke6ZYmQqSsoMg6if
         iry3ZlLa7/9+S01vjxRDtv6WQnkzJMYn4v/hPCOwvt9MGOKtMgm9HkSwzHdoY5mMHCxu
         BKM/B38z0e1/HfoYakA7XkSskFVmQH70hEnhKr+lzJiK5iSEfAg6SzQO8BgojQuaQLnn
         5tbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0ECBJQL8Vh8RvECNcJ1CF1oSG2EUEVKrzykxBdK9hDQ=;
        fh=pAChFzNTqARL4YrsajdWuCcf/ksx++IDZnadiYzNhEI=;
        b=QB5XE+tYS+8+Lkh0bBkJFdCDMUgb6Qog/Yx2byDAADBW/GHEeuEBEJ4b57kd384aMc
         HKFnzwQ1nYXz1+Vz7/kllGIt1dG93VQADgZb0MEPSsKXOiZ19AH2wkBbsLdQx06/E9Fe
         stOa6TNXB4lkTEkfnsgDv58nBS9grAi2cpFpbEQRNQLbHwndq9vyB2svoqmLPUMbtEcp
         /QDjpuLfb9UkO7PZIhwF9AqhPaHpcXl3QggSBqkF/owSBZBEieMT7bG0wsNAQqqJ+1In
         npold8jewLzihsytgNpzU5EynWS0NRMskbdRaxGmyuEgNowLiCGvHeWG3cw2KeeiJoqZ
         NKuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795626745; x=1796231545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ECBJQL8Vh8RvECNcJ1CF1oSG2EUEVKrzykxBdK9hDQ=;
        b=ocD9F2gJExhP/avZYYow/WKZcW4dOuBQ5OB7sGKTiIY0aS0B0iMchUncy0j77h9QT3
         NREg1SFg0iIeoo0Ld5T4UztbybK0HHpzowc/J3jwfPYWcKESNbmEFMmI4y3umUuENFKr
         8aK1yrPkvz6uFRinHiCjwF0ZViSsHdSrPJHoLAhUGbf2Dwnz0A3Eeocc25PSrjImogHZ
         rM7gWQLdW7AQUF1EdQJ1SRrnHvyvDUor0SdLZdI03TM901abQt+7c5tb/q57OZI/nwRj
         /DlIwOf+lB3OSoAm3YvAmXlZKR3GkdSY5kA3UUD9mQvbTdHzAm3w23KVz/nsemyycuko
         BDtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795626745; x=1796231545;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ECBJQL8Vh8RvECNcJ1CF1oSG2EUEVKrzykxBdK9hDQ=;
        b=tWRN+v9sYDbjpr92KTtyOJPjlrYm5K754fpRV3YNEODED8jQdxojVpxoSx1/VeGM+8
         hsHpRGDCASBNRiL2LjYrc0hBbqb1QhiV/Du6umr9DupAjIqyDaiGIfzu6fpj4wlhvcen
         TE43SSZEd27GiCzxRQGeI5dC0nFomEmcJZ4LlRcAWlYXfql5UmdLEKd+HoJ1v/YMv0DM
         GOtnemPECyiQpk8aV15wFZuv7B7SwcUfeIQ7qRAnyeypjw4C+FlXlL7jx1BGmzIj+Qdj
         NWP7UMDKsZE9VT1OwVcQStm59opNnSl6mpem8CNYujdg92isVVtV/JCu5aO5HICfETpD
         p77g==
X-Gm-Message-State: APuU4Z/9ZygrK64nLUGYEaEOAufv3X+hoZm2Na+V+AeDar48rfqS8/JK
	CTVMYbQLgirNZZeamv2GoHylwl4Diyz2AEt5npLwJ015+hPtRbm0e8gsa8hkeSTH9DSWi+41R+e
	I0SreTZQEJnQ/neGw9PxXWhJozXOdV5Q=
X-Gm-Gg: AZFdTZfin++VsWL5RGZQELMwIU6Q9osuqA0ZkHobnJ6H5XGN6AcAsDZgu56mTHWL7uO
	YsxNBFOaJTeVmE75XCwIudLE9vD1qkh1Q3M1/vVMh/wuWA61FTsMXQJe6U4TK65P8FWaspkONYL
	z3uVYkBR/9OrachTOzK15CPOFRE9u5RZ2YXwRvePQEaKxcrI0Vv9/a60yVKunFmztYFUunXPJSm
	KCg5jhbQ5UM4rXUD21DxxY63rfjKqplTMp0d+55khWmeH5uKvEMFpvQDBAlMQ2iCwURokmdWc1N
	fohXo0IFCmDGCh/k4eqnRotP8o7iR76wuPeSKPVhEa/HPipb5J4q/dwHYDoznZJKXHLAKf5XvOM
	0mISG4rFfiRSNnx9g0R4hrxvl4ltbhK+6GOdD3xXaIh8eoMMHeG/UnPBMZ0hWfTZDzOCP9vytPB
	EitPUSeCC6mLaJ7Xg2jfvtjQdm4V706/wUPtTfXztTbp9BLM+E03YlQRKoGCEIkIsWNq7Ua4gEW
	HY=
X-Received: by 2002:a05:6000:22c2:b0:4ad:5e91:8fcb with SMTP id
 ffacd0b85a97d-4ad5e918ff5mr40436095f8f.25.1795626744643; Wed, 25 Nov 2026
 09:12:24 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125095201.98279-1-tianyi@cloudflare.com>
In-Reply-To: <20261125095201.98279-1-tianyi@cloudflare.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Wed, 25 Nov 2026 09:11:48 -0800
X-Gm-Features: Aa3M54q8-DxDcUDtWvuQUs-FdItJ_4u0pWoknbY5prhGbfAwCOiyuV9WM_nf0wM
Message-ID: <CAKgT0UcvdZgtNtURJGPqAJ3dPGnCpa1DbpX_KBbEmoK==WXNSg@mail.gmail.com>
Subject: Re: [PATCH net v2] ice: do not report CHECKSUM_COMPLETE when an XDP
 program is attached
To: Tianyi Gao <tianyi@cloudflare.com>
Cc: netdev@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Paul Greenwalt <paul.greenwalt@intel.com>, Alice Michael <alice.michael@intel.com>, 
	Eric Joyner <eric.joyner@intel.com>, Jesse Brandeburg <jbrandeb@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, bpf@vger.kernel.org, 
	kernel-team@cloudflare.com, tianyi.gao@linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 1:52=E2=80=AFAM Tianyi Gao <tianyi@cloudflare.com> =
wrote:
>
> On E830, ice reports CHECKSUM_COMPLETE with the generic checksum (GCS)
> that the hardware computes over the received frame. If an XDP program
> changes the packet and returns XDP_PASS, that checksum no longer
> matches. The stack then checks the packet again in software and calls
> netdev_rx_csum_fault().
>
> On Cloudflare servers, an XDP load balancer removes the encapsulation
> of the packets that it accepts locally. Our production traffic hits
> netdev_rx_csum_fault() all the time.

Thank you for addressing my comments. My biggest concern as this point
is still this opens up potential holes for exploitation. While it
doesn't appear to directly enable an exploit it is one of those things
that can be stacked to allow for someone to take advantage of things.
I would rank it up there with the e1000e jumbo frames packet
truncation issue/fix from back in the day
(CVE-2009-4536/CVE-2009-1385).

I will give this my "Reviewed-by" as there is some level of XDP-based
shooting yourself in the foot required to trigger this. However, that
said my suggestion would be to be very careful stripping headers like
this as it could lead to future exploits.

Reviewed-by: Alexander Duyck <alexanderduyck@fb.com>
