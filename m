Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795104970;
	b=j0uAJkSUxZyihXQXn+1yGRu4zetpunxQnD1mrmEG6EDrfzSr976BZoV8YeDDrZAzIJpf
	 x1Tpsq6kbnUxuDZr9s0z4pDnrmZcaioSw9/cMvrnS0izmuYOhvAN+fWjixYJPwBmW0Pss
	 35CiMywvXHh3VCMShh62+U4XjMz/32KE1IrkmW20SzFyq3itwb3hm7g9w/v3pSk3IlfDY
	 du1/fS+i6Lm1jmqEt19DqGnrpTb6h3KEAmyVrAR29Vu3MdvUkv1fFwTwlHzrxljP4lfLb
	 QiFPH7oLQrsSjO9aLDHsYp15ugfYOZD3erKPZIJ7+IwrFLAQvph29zus7qrSqY62x9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795104970;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
	b=lEfiZC6PdVLjZoTNbzf8sGgf7xcK+rlcliAREXMKe7ml1jjrJWcugGiRjc6EF6ggQjFQ
	 87vc93oK8PQsQJtpXMXoaH/C9hk8bK6mPbac4LXV/jMgxy2yVw2ygvKQeArSNsBlPpjhT
	 fs/IPyZL7t0K30waSXmyBuP7QEtBlV9vkBQA1wBIlnL3TvdH33+h+Q+2jGZUvRVpniNfs
	 3JFKo+9RZmiKk6juGL89ZEmwRIclBhOe7rdBtIxL0ZIo3emQVy2FyC8yU0VaXy1MwCfrX
	 m6VUwV4IfQ98kKppLEJtr2kQXDZox249hGbp9ZkbI16hFC48anhwk4SiUtxtegEr0tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPTFUBnK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FAE606A337
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 16:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22FAE606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SPTFUBnK
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6b71ee00f0dso11665a12.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:16:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795104968; cv=none;
        d=google.com; s=arc-20260327;
        b=WUv1555ZC7n5H21jiCrXyeUQTB+pTlbw5iJPl7TYkwQAPG9xRX+BByAb6TkB+Tzi/W
         YHy26HpvaH5xQGdVp1kQc03MY2NuPEqGexcXQBtz/WWgP0IMZZvtHiFQRkB/RyNG96JU
         PFcEeaSYb0MK/TgBib2kyD5HtzAn0zoUxc44SHJZiXBCk51vlA3bF3FGYnWRd74Ysnz3
         35TSkgO391zlVJYfa1ETr3WsFg+JOvn6Wl10uKdy0GAaM5Zvd9e6w4NBUoeDlHFN06hL
         yvM1cKCoJZEcKQcVqp3qEaz1zEwAO0lG3XWeFoCCS5MK86JztWuWBhAwnRAE24Fe6cMX
         y+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
        fh=3WuxnleisoTDLUFW6ymmAA/e/KOzryqeas4g9VC4B5k=;
        b=OWF5JYc15vgE+7coDcCKDok3VYX3gFmenTQYRWFW5DWYNBAHp2HcCz13Sf3vgJepen
         xyCn1DSeLlaSnbSDvAFE/IleiWL9eWjn6u9Ek1Ditkjt2zitIOaz7g6J2S2u4EQmEus+
         UoaDO0VxvT2uRiifVbrPsYKQOIrAgc0nsoJDJcqkhdgH0qmz3a7DOsblXXfn6zhxPvvh
         ReMNFZgknUB0MKV5NV5b4tJL7K605KWGURgu/aAidEWpVKeAF+MaTUE0ZmwCHcC9pWbC
         pnyCxcJw9aAnw8PiSbCOYuhCx03wPUSYTZdlJRnU4eN/3fsHYMqc2Q08b8W7CIemrj3d
         +xgw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795104968; x=1795709768; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
        b=SPTFUBnK7Qf8DDFG1dkbrq+4jI3JE0lR8/YfG84QwF7qkJuOqgiNCatI2ceCVLboWZ
         Aw7ykVFnmagdBpIptbkQWV+tC/biwlU+kghJFhH250FMWpcYHs3Oc4lrkO/QNBUjRAWT
         ole8LWM58vVerK+bK4rVttZlvcFbV4JhkB4PJsqdooEg2+6zFfi4cc3GNTa2Fv2R6skh
         ySxahTl2H0as7ZduuMddPsmnztMj3PDGV+d3Kv0LSRNIubrsTLvYI/cbbni3JlZSKuHk
         9ACUeSBxgxMczQkuay4EwKAExZqcqfmC4kAhXStvwVjuNkDS/SJOjPeAGNBD5dmCZ0aB
         wo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795104968; x=1795709768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bJI8gD0Ac7PYn33K2ihlAz/CUrmKd315SjB/0SoP/9E=;
        b=SP00BES5KKU2WEs9SNICG0NcyDvjdHUdEadXNfjXiGec7PVBf7ao4nAcoHrUFMlytb
         jIuDFQSV3THl8KyZ33T9/EmOAU8KS99vdvWmoPsEgj/ApJ+6QtaBho2+JA7XbC4+hCym
         CB6af5dXrHhjn/9B7iV8OLx+0ag5YB/eYq2yWEgqBJYupayzGoQqFHkyl3qkUgudvSrs
         Ro9K1g/0e0Guw4CksM+90ZHGfW9TRpeffSUXfYgTgwC6antW6Q/DSiPrIui25TrxjhcF
         bzxc6RUCIyUO5vtpDcLdI+v+YsQ1yyFT/vCdDE/B5TBDSe+O2YmOTmprU/nzrw59FOMD
         SOcQ==
X-Gm-Message-State: APuU4Z9mZGEMUaC5kqqFpmEEBLiJRpaH7vOUDcLztnizSUFiuZVIOOw6
	x8nRj+f6RK8jfz0Q4C1AgndFmQ2ich/9ruQKh3WQqWR18Yamj8/s88wsSXJmAPywKZSPs5J8wQM
	UQawDMnjto3dcF7TxcGZqZ0mLhebr2NWrgVUdk0D7
X-Gm-Gg: AYBFou3aYhpXxF417xGux2bea55BJLqt3H3iPMOP0yo6hMNi3cCwjyYLG0Bhqs8ZlM3
	5MOcHZABvj+Jf2eaRjHzgNd89zFNO/11J82e72Y4er6dEXNOOu7csOYLzFJgjccHqcJsQuELxh/
	MDTqSiqKwtNSIHwUyohL2tayg/hAod8u4EX9jcA/skkDF9uxHhuIMk/SLkwg2ob1KkZcsS/6Zx1
	MOsx5PD8g8aq9XAvGY+IYKeevkEElKLY0tFzzlC6aLoGSYIMEJGlFO4W5V3J2tcFx3/C8gtkz/C
	lt+s60JXRWtVnrTSo8Nek7NuG/aXoK09+F1WBxLfMMREPFsiEyMgP9WhYpSf/+JxVZipyoBsb4B
	mbIm64qRHxV6lK62BrBzBibauBTHlSfeGUsmxQQ==
X-Received: by 2002:a05:6402:51c7:b0:6b5:77a4:e7c9 with SMTP id
 4fb4d7f45d1cf-6ba131a3dbemr82306a12.2.1795104967627; Thu, 19 Nov 2026
 08:16:07 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261115004003.3695475-1-almasrymina@google.com>
 <20261115004003.3695475-3-almasrymina@google.com> <20261118161559.0c2b62f4@kernel.org>
In-Reply-To: <20261118161559.0c2b62f4@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 19 Nov 2026 08:15:56 -0800
X-Gm-Features: AclHuK-cQTKF7jYWYblSKC0I9f-VOi4_3YIo-2Q9plq-4Xk48gzO6bo0YF86aTk
Message-ID: <CAHS8izMOHKQydib4DtMT-MgVkyrJKJuUmvL18g+SHZExNdyVZg@mail.gmail.com>
Subject: Re: [PATCH net-next v5 2/3] net: prevent mixing frags from different
 memory providers or bindings
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@kernel.org>, 
	Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, 
	Kaiyuan Zhang <kaiyuanz@google.com>, Willem de Bruijn <willemb@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Pavel Begunkov <asml.silence@gmail.com>, Daniel Borkmann <daniel@iogearbox.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 4:16=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Sun, 15 Nov 2026 00:40:02 +0000 Mina Almasry wrote:
> > Subject: [PATCH net-next v5 2/3] net: prevent mixing frags from differe=
nt memory providers or bindings
>
> This patch needs to be split up. There seems to be pure refactoring
> here (validate_xmit_unreadable_skb())

That's actually a fix. Without this, iouring rcrx skbs forwarded could
end up going through a device to which they aren't mapped, afaiu. I
guess splitting the patches will make this more apparent.

> and the test code also should
> be in a separate patch. The rest needs a close look from perf
> perspective :S

FWIW I worked to minimize the impact, which is why the patch may look
a bit convoluted. We should load zero extra cache lines in the case
where both skbs are paged, and only load extra cachelines when we've
confirmed both skbs have memory providers in them and we need to do an
actual provider check. In the next version I will include some
analysis on that in the cover letter.

However, we still pay the cost of the checks themselves.

>Lots of checks on the fast path to fix a hallucination..
>

I wasn't doing this because sashiko hallucinated it, I was more doing
it because I was aware that some mixing is possible, and saw folks
were trying to include some new memory providers (AF_XDP, PISA), and I
was worried some bot will be able to reproduce reliable crashes with
these edge cases and it becomes a real issue. I thought to fix it
before it became a real issue. Let me know if that's not valuable and
you want me to punt this; for now I'll follow your instruction and
repost with the split.


--=20
Thanks,
Mina
