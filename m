Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795170242;
	b=zK6FuTZFlRFB2gg103LDfWR2PDl237SvGIK3/N5l1dD1YNdZ+jnI25cuTn0KC7a9nLK9
	 mMGu0lXDf3DZLysSti9zMxmS8c+40p83AOn3r/8uX4FsVJHXXJIB1MkVeyFl+VshSHs/v
	 YgXFXJU17p3XPVWUcsDQlk8jnSPBOOzbaNip37IAD8ucrZ6/6lviYaI5spfD/SbIVvZoN
	 YK4iZjICmDxee+C3387A+SFh92Qqle6fkhJn4jacf7fxu6hnWiswPYCu2ShXdHKADOcsl
	 VOcPW92ZEPQYOYsWS0Gn2jChuKF2eGE6S5Eqf5NB/3OPZLx3KYzWOSjZPWycd2/dNIg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=l8OZaZuTRSXwE+XBNWMHBSQi6ZAfjYJlC0IBxUgqIMU=;
	b=vQYx4upDJj9C8ZeeliFofVAlHz60F14a1xEvSjsGEXiSZIxVxlI3KCIOYQnsLd4WR2Ad
	 fkXRqHauh96Yn2UocqZzqpn4bBSDslyZYiO+1upJy6TGTXqI882OuZPorAPwRuNAVIyzm
	 52EIjWfJz/LwQ+L5Cs2m89zpF91gYbuGVwMxyNpvwfUl+WziU4KYZQdB6oAF0XRor8aZh
	 m8FoGYbjFwlVJXX2JpaeX8u0/IgvtTUjMpuWPCuXmYgHI2CC3yTwj7ZuBKd2dnJ8vih8q
	 o9ukbYLHuehEBUd/YF/E8ocg+oXptw5i2/yMPBXYhSBbjBsRrPMrlrilZMpXCKnUyOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=EnqK7HkX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BB3606A326
	for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 10:24:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58BB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=EnqK7HkX
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8c700d6cc0bso1084557b3a.1
        for <netdev@vger.kernel.org>; Fri, 20 Nov 2026 02:24:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795170241; cv=none;
        d=google.com; s=arc-20260327;
        b=G7kpCZIAnd96V24857Qfl9PHK6WMUDmJnMMh707A2fY5EE16EyhfYZos3sx3ry+OtD
         xED6Hw1XEZwff6LQoDtGhXz/zyCGbCEdtvYmqlc9yt+j+gHreqqKi6bY8BdcmFfBSESq
         1TCYOLhE/SAGrb26ssTDKdYMfOww/FArBJl4jGSIiK6i7bennUzs2g6+cECepTeiGjkD
         5kC876XAXshO2u6MKlLkO1mrC6Cz4iJRlR+CkM4ePr4siyAbQ1PkoQ2yg4bFc5f9Azyj
         4kI9kUFpEU7UtMoKXnC4/14sOw8rhNXki0WU7TpD1xa+clsFj5oPPmeRS7Ue+Ej02Phw
         QCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l8OZaZuTRSXwE+XBNWMHBSQi6ZAfjYJlC0IBxUgqIMU=;
        fh=/JIN5wWHz+G54Bu9ieQGlWMgJnMxjFyVJb1ZL8lP5C8=;
        b=FgafnZyuswCGDpjpIXYYzDrvmLl3x3jg/gqAsscp27QMzEHCPh2xah+RfrRKRDpogj
         VDMfFpwLEAXoNue+oPbnTTWnJOoh6g6O19xD025VodCSel95G/MvD66PwM/7F0pgM8iz
         gd2B+DoJuVlHcW6TJ/4W5LXnlzjbuKyEqN/BauRFzQxFuRTBM1q7Pj7S04AdPnTJU9GK
         /BCsfb3wMz7e8cw1Pj2Rfmy8cQd/23YGSbywhukEYqb/m3WK/8BABqsATGS2Zy597ssp
         3rLddq2Q4BrH7Jk6oygISXSHA+7payQAjS0EApFH6QEgAPLicacmEsWISuccZ1IWjU6m
         URhQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795170241; x=1795775041; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l8OZaZuTRSXwE+XBNWMHBSQi6ZAfjYJlC0IBxUgqIMU=;
        b=EnqK7HkXV4JMkwZzUoD1n9df5Yb4GgrxRydt5bPKL223c8+YcRi15Xt5qGllawfpNP
         muzRUlcsV9WhP3yuhl3CRu2fzIi+TJtoclv1dOsJCcAoU5wRlCQPBDrDEIeX7wW3Q1Tj
         6UWFCsGRstmHBXj6QTM3X71/0cwfaLIkR8MaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170241; x=1795775041;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l8OZaZuTRSXwE+XBNWMHBSQi6ZAfjYJlC0IBxUgqIMU=;
        b=KVi6gkGx4X3LdUabUSqNBBoNICRphCfOjB29yWEgfSib6yQeOk2qovfM1lQl7mNfr7
         53LtykGE4GOCmXCH44FBbdCn5YbKZBPDstBUPxl8y+n0OjC4ZvfiwAgt3vI25R1ierUw
         4m4/ckpsmR+xtAi4MRfhbRhVf23V9bVnGe2TJ62zWIZUgmfKE03Knv4y5en/4ORzR646
         TRdSsywcyHx3IKOFnNEIsbI1EdcFKKEyXbnSsEYjznV2Yo14dB1OwINANXsIFZC56ZEr
         VseYLawsa9WykJNKtPAu6OzTNWfqlN4bePCePuSnYwi3Xk5RrSVk7clSF5DqMOIXWumh
         Tk/g==
X-Forwarded-Encrypted: i=1; AL+hErEAQdoKzM4H5iz+18VP+j/jnjtYn2Zo1mXQlrnMgm81sryGIUERV42Dwwuxg4y65X1umfvOLg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wiJuNuKmrpBpnLKBDYLTvVh7b12EZW2Ez1w9TKv/bCZLqbwn4
	ZyPKB18h0CDt+Hz1EwBOR99zc0NXyWHaxS9CDK9IGvZy78gwmleGPKUPGrWGW8Mm4k+OYVspLPn
	NvMBZrz4ARDH5mSarIKSuiKUl+PVvpewZ8Vzctp1lS+oCzunU8n4=
X-Gm-Gg: AYBFou0T5Oq/tVKQ398Gs9uAhZPUoJTab8JMMfzmXf40m2R0iWgA9hIivE9ctJ0/HMN
	ekIfun0IsYs+0h7bkPGG/PfCNfVrwzmdrhWHjDHUpHLqhoP0ajitP2md31NaJtTss5DFnUFqtlQ
	GL6t2OJtlLDoy8ZA4UD5M14c/ZbeBUX+RgonijdUCWu9q0aMKjWp0IRu49/pa9oP7QZ8qGnBYWq
	2eyQWTIC5jmn8GkIHkDbVTLNJ2t8uCCOZ66ongvdZ2tz5MNFm/LEaDIe0meYYvg43dZZQ6jkUKc
	pGIjTiwXLIbQ6f9ZzAniOG8smoRm5UY18qkjby4WJQqp752cQBmpXiDsbrM1hnBxD32T2jX4ZQg
	+znkiwNuMto3GcZA6ViC7jV7NCeZRTQERM5+W/I7nLU+eNvmMeH6o/3aHLD1YITD2UtDjnSs2BT
	pni6hsrttr1nHJD4M=
X-Received: by 2002:a05:6a20:da12:b0:3eb:b2fc:bed7 with SMTP id
 adf61e73a8af0-4014d35aab3mr1802003637.16.1795170241627; Fri, 20 Nov 2026
 02:24:01 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CORE-9NOG.v4.r0.20261116135311-4@mojatatu.com>
 <179511856597.3136.7846835490904436138@kernel.org> <CAM0EoMkppFKECwmjw+E3tWpXEL3=cyg2VYhgpL+StaSiQf+WAQ@mail.gmail.com>
 <DMZJS8O5A4YX.9T2P4DT0DAB7@gmail.com>
In-Reply-To: <DMZJS8O5A4YX.9T2P4DT0DAB7@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 20 Nov 2026 05:23:49 -0500
X-Gm-Features: Aa3M54qRL4Ivjl9xk3_JYL8OAzBjPxDHeKoJxbXTubX9anSYCOsmGEkXxaVdsds
Message-ID: <CAM0EoMm5qit+KP27XV_Q8hHik=KzzHVjSfLDJg161Jyk0xXBZg@mail.gmail.com>
Subject: Re: [PATCH net-next v4 4/4] bpf: drop the stale dst when redirecting
 to an explicit nexthop
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	daniel@iogearbox.net, john.fastabend@gmail.com, sdf@fomichev.me, 
	martin.lau@linux.dev, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, 
	song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org, 
	emil@etsalapatis.com, ihor.solodrai@linux.dev, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	bpf@vger.kernel.org, jiri@resnulli.us, victor@mojatatu.com, 
	sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 5:40=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Thu, Nov 19, 2026 at 12:29 PM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > This is still under discussion with Alexei  - so:
>
> Answering your earlier quesiton:
> yes, a route for A is acceptable on a frame that leaves B.
> bpf_redirect() and mirred egress do that today.
> __bpf_tx_skb() and tcf_mirred_to_dev() set skb->dev and keep the dst.
> __dev_queue_xmit() drops the dst when B has IFF_XMIT_DST_RELEASE.
>
> > I will consider this feedback if we have to resend the whole series or
> > per Alexei's pov 1 or 2.
>
> imo 2, 3 and 4 can go.
>
> So pls consider adopting my earlier neigh_update_process_arp_queue() diff=
.
>
> Need to think more about patch 1. It's probably ok on its own.

That answers it, thanks. 2, 3 and 4 are gone (pending testing).  I'll
send the guard as its own net-next change off your diff.
IOW:
- 1/4 goes to net on its own (Fixes: 94151f5aa966)
- separate net-next, your diff + some comment lines

cheers,
jamal
