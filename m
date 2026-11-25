Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795605271;
	b=2Vc/HNEcFZr8k5t+CUHO6TsqegvK/y0wwNri9uWYpOt6Owj4iqmqR0wJVqBQbophSAS5
	 mpkOLYTdbxQTUdFDzY7/rCRrVmLZx8cGTNlhDYvUxRy4vnkkKUkKsLxrrH6oXI+knyXJh
	 o93ijj8z/CsiYXMXYdJ3Szc1yRjGc+T78ttiSVXQA9vgCkUVMKESIuosy25fVQLqtgozb
	 K8/crqTTwcUQbFHIo/NEyY3ybirKjMArQBz1QuJnf9OSZsMI8/dkSA1vBTH4yevdnVnLM
	 LbXN7LhM9KekhXyvQ00M8LDO/LklUFmX4/70OqbUTC3OMHdaQeCYBtoXHdHdU2qsGiw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
	b=y8ETPwcwn/ZmbBK/3XJUpgPfzo2yf3lzv7HJnaJpaQfs9Rc5xAc+WPHcHUw9xs4A4n7v
	 AcD43osmXOxOJbkdteXubs0NHxeTx1chTVrWBv9NhDQ7xyhr/oryubCEL+C5peXiwMUbu
	 o2K5Bv25DmKzGzMi1RW6XqTVozSAy80AXO/ss76hsJIlOWe6Qu9OOj9I9vwDSWHMHR0OY
	 TIeDVGjfGX9PFgYYAik+4AppNbOdoYTMuiwn6Ta4Qpj3HXUlufo4USS9wXmicPjqvvI8s
	 RA/OZ/IxwsWUTy6y3yc2sNHpyN3dfpEbG/SNmOKlogG7PyQcv1puPPFTcSkd2rvB/Bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nebusec.ai;
	spf=pass smtp.mailfrom=nebusec.ai;
	dkim=pass header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=a6glVQ0b;
	arc=fail smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 139A8606A327
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 139A8606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nebusec.ai header.i=@nebusec.ai header.a=rsa-sha256 header.s=google header.b=a6glVQ0b
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3afa1c39d76so4154061fa.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:14:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795605269; cv=none;
        d=google.com; s=arc-20260327;
        b=MO1juiJx9+3hER71U55jEb5vMRoTFPMU062RfcxuXguWDeNSiQgtopZc3lfgzguH+P
         tt7GpY2npm9191zQH+uURmjIov74nZNNrHMX5diYGvuHvLu1qKIWe6QNz6ZosQ3LAAA1
         mcqLmn6hvdR8w/+ZV2gO1BE+U2oq/iq6QaGrwrtYh3mvQjFbw2ZVLUGfYP0DAOsdbHKv
         Yqir0SzZsnmci4Z/Mye1IHWtleHVPZsoOLb4EIyCxXIpZYmD6JNpZiHjUugvtSihuoC0
         9VnZBboO+xzpfWNSS94thuPeh/JSX4tnmJZbKhHLp8qWEQGVtb/NAThaMDJ7UG0YtKHm
         xgSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
        fh=NnCFNf7l4O9zh7KGAZtX3xAxlxTYDj8QcRxZge0CDlE=;
        b=BHNbLT6cHuDVnOnqpeVGQDOaunTpGC3vTSBDO3MNERes7bJA0l9msNhu5hQ39OUziP
         0rWcfCI7Lo/nJtc79gn+6HHxfYVIaCsNeEpOadlkjKtbZ2XgTS+oO0jwI0tp6xEkIadn
         nxZqdz0/XA4IfQL5c8E7yt+lmQ8LjTCXRSgQ6O4ATgGO8DWSn029nJ4XqnqQEWhVsP1W
         2KqNEzpcjjKbaZeqAPBI3vwpgZSSl0LxNgPYu7+GuhIPHC+gMHq+5FF4oKPkP3Y260sB
         uRc+ZYS/4U3f1FEqj9G5IUdhBYMrEOos24cBsrEwNzB/nrR/gVaQ5+gzUdvjjQyRfSa9
         Tg5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1795605269; x=1796210069; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
        b=a6glVQ0b9RlcjY/b5/i4tsdSat6HduNC4kzJKicID3444iFD6Glc9SnQKkIrYfipjq
         qpNipmvZg/L4BLfhV7UCRhym2p+dZT9DfwtT7uECJWY1yohMsNt2NmmxYKx+Uu5gxzZW
         zqg8I1Q2SA1JtDjcxxhQutUS8kZEifD0/LnFoksQpdm4WzFS/asA6Ts1BWjEfJJMIOJB
         adJMVnPF4No7yCgV2ZQ6WvDQchiKKeHjFK+mionN+kXFFJx3cyi+IXQmsQmy7OgPv5kw
         Id14Y3PLsFB1LbA4QTac4hAZoeAvWtiaypIQWjvL33nDDlL0AaZ2AgXIN4My3jbMnASh
         +xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605269; x=1796210069;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/WbQLbOVHSAoTWuLGv+HW4dYfMA6ahcKB8KXYloAqAc=;
        b=F9YMoiciqEJwIfkMOtrJQxHih0fqTU8n5MaaJJpFbLg65q1gkslZe2y5npb2EgCAn5
         p0UhDyHgRzh6E84s58imppFw6BBgq7ZKdhsW1oGIMta3c48Dmh4P1762JSChkU9np9Zc
         zokhwy2D4U8iJQxs/n4LtD38WWvwOa1QKRtJ9RNHXe0A5F2mXN1aJK06HSmhXY+DKBJW
         eikbdBTfQBp0Iy3sEmUyDS9Khiu0q6dHiqLsE6rtfYND8dLHRLDR6s9nDX7Ra7X/vEHi
         v4Qt8sXMgvjHD3IbCV/YuTcB0S0Ur7eEP2FhEYe+irn4nYpQNOwvD0o5JRnnSTxpN7CC
         76aA==
X-Gm-Message-State: APuU4Z97eRC/z5j8R/4myMv9GC7uPz2oRsypTlHJQEGPJ+nB8EvrUVBd
	IPcGdbyBWCZAhueX9o9pjU7AhrPKQ+dZHL2FFN9IwlRgmFGCAiVokwjBbAhWfjfG/Q/BbnjYAKT
	vMN8vKpqOIcm6vEqUoiJmhJ9UgXx04MNHfdPDHwyrSIU=
X-Gm-Gg: AZFdTZc2Ejw32ntPbPs32ao8dYFVfZkhIqNUx7DrdQmQNC9SC7hAzGQw0FEd6G0BqOF
	/aK6MrG6EH+MKw63lQBMitNQ9NzTMnSnMM1slhUnTG0Ya8hsLOJSpr+A/eTeWtQAXVAFFyZ+u+C
	ykr+tB8uEtTfDUAB2bjT5r1cwKgsVxpD1TFHBDlcojVg+//9cy4MgkLN74jjeAa0pK5ZJ+h5uII
	O7hQ9bTpHFKqBChuZ61ZlxpNY2KeJaVEurmmIai/90JeYqGBOxt6OcAjYLCwH4MvO/fDxb7y2np
	f4h9W6ta31uMCLxGOZn0Iz7aprWBBwuksLGwP0dtHi57y9np09qHWDiunTwmatmtrnpGldv51ln
	2AXo+0UTfrsiBXJONiHaueD2vUvyFdBx8PY+P/XzZ7uXNROs2qjmru1fWqJKQB2nCGww9dhLUtu
	1SMl8nyezUZaiJtQAoZYeNYpgKrSg=
X-Received: by 2002:a05:6512:1396:b0:5c1:ac84:c105 with SMTP id
 2adb3069b0e04-5c1bc8e701fmr5040864e87.57.1795605268346; Wed, 25 Nov 2026
 03:14:28 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116155229.318582-1-zihanx@nebusec.ai> <awa-F8TtQllwfELK@krikkit>
In-Reply-To: <awa-F8TtQllwfELK@krikkit>
From: zihan xi <zihanx@nebusec.ai>
Date: Wed, 25 Nov 2026 19:14:18 +0800
X-Gm-Features: Aa3M54obSpIFTgOpxzvlbhG_4pABQmeuGB5Sw90aMOsN7FqTvFvI_Y0VnB8DBDw
Message-ID: <CAANe3eQhQD=6s-Da74_bEy8qNFtOp_kCqpqDs64TBv0CAXdKtA@mail.gmail.com>
Subject: Re: [PATCH net 0/1] xfrm: espintcp: fix IPv4/IPv6 receive path confusion
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: netdev@vger.kernel.org, ipsec@lists.linux.dev, 
	steffen.klassert@secunet.com, herbert@gondor.apana.org.au, 
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	vega@nebusec.ai
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sabrina,

Thanks for the review. Your questions are fair, and I agree that my
original cover letter did not distinguish setup evidence from evidence
of impact clearly enough.

On Wed, Nov 25, 2026 at 6:53=E2=80=AFPM Sabrina Dubroca <sd@queasysnail.net=
> wrote:
>
> Hello,
>
> 2026-11-16, 15:52:28 +0000, Zihan Xi wrote:
> > Historical QEMU run output:
>
> I'm not sure what "historical" means here. Your reproducer will output
> the same thing before/after the patch.

By "historical" I meant that this output came from an earlier QEMU
run, not from a fresh run for this revision. The socket output only
confirms the test setup: the accepted socket is AF_INET6 and the peer
is v4-mapped. It does not demonstrate a failure.

The relevant observation is the ftrace entry:

xfrm6_rcv_encap <- espintcp_rcv

It shows that the packet was dispatched to the IPv6 XFRM receive path,
despite originating from a v4-mapped connection.
>
> >     accepted socket domain=3D10
> >     peer=3D::ffff:127.0.0.1 port=3D41512
> >     recv=3D0 errno=3D0
> >
> > The historical tracing additionally showed:
> >
> >     xfrm6_rcv_encap <-espintcp_rcv
> >
> > and XfrmInNoStates increased by one (before=3D1004 after=3D1005 delta=
=3D1). The run
>
> Which is expected either way since you haven't configured any xfrm states=
.

Agreed. The XfrmInNoStates increment is expected without an inbound
XFRM state and is not evidence of impact. I will not present it as
such.
>
> > followed the no-state/error path without a KASAN report, oops, or crash=
-log,
> > so no crash-log is attached.
>
> So this is just a "regular" bug where things don't work as expected,
> right? No other issue after we pass the packet up? (still worth
> fixing of course, the patch looks ok)
>
> Earlier you say "the vulnerable path", and call the reproducer a PoC,
> I want to be clear on the problem ("vulnerable" and "PoC" sound like a
> security issue).

I agree that describing this as a "vulnerable path" and calling the
reproducer a "PoC" was misleading given the evidence. I will use more
precise terminology in future revisions.

Based on the evidence currently available, yes: this is a receive-path
correctness bug. The demonstrated issue is that ESP-in-TCP dispatches
an IPv4 skb from a v4-mapped connection to xfrm6_rcv_encap(). I did
not demonstrate a crash, KASAN report, memory disclosure, or a
consequence after successful XFRM state processing, and I will avoid
claiming those.

Separately, source analysis confirmed the control-block overlap
addressed in the current reroll: strparser metadata overwrites part of
the saved IP control block before the old code restores it. However, I
have not demonstrated its end-to-end effect with a valid inbound
SA/policy. I also could not substantiate the proposed kernel-memory
overread through IPv6 ancillary data; the inspected helper
bounds-checks reads against the skb tail.

I have revised the cover letter to distinguish these findings and
limitations. The reproducer demonstrates the wrong-family dispatch; it
does not demonstrate a crash or security impact.

Best regards,
Zihan
>
> > We run the PoC in a 2 vCPU, 2 GB RAM x86 QEMU environment.
>
> --
> Sabrina
