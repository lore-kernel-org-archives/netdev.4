Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795009040;
	b=p0lgFDPqbyr/8ajpgokPpQoC/ZbRVcuWCuJIaZEGSB4CVoR7Ale1QBp36zKVts/WbXp+
	 U6a5HbRT1DLHoYeyzAfzC/O8TeHZ/j8B5bV61C2M0Kxffe/g03UIdXobvA0C4b79XwIqw
	 5bi8uRRV4moY7QO2ALkUkIsiqdjSD0+QZXLr8MEyIdDUxUZHwLuhrVzAXakPBe/LLcKjt
	 Dg5qTQ0reZWGuScsVZ18zga+UzkLh7bu5mV1SBGx1d94ALjK4HXJxh4cbqlobPC/VwdBd
	 8/bI1vVIMFZiZTogACzoxTo5QYoMUQesgTDcvCfScIDO5zJsYZyAP1k6r0KwWAfF0lQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795009040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=+Pne64dTPZwiQyGJLnEYc8Ub7GDR3IIujV0fV2jCbvA=;
	b=gMEF4EM6wtlTAUmVFCjEVlhsYka8qkDeACjboX+AQokOTi9rgr+dJNsZoaGBKTIqC+ob
	 PSRGmxJN443EfFMwBL71WNyi4+UXvo1WPB26am/F9fFSAS4wrKamvwYn7/bvLFRS2rlsq
	 lGVf4T8ZeF6i5Q5+sHAzOVfHeBgTeV/p8N1HkcnJtxTVUXc/m8VG97C/euWr64Z0jbDqL
	 mk+181VAM0B5sPjUFipF+SCXSRL0dpd34ZZ7CpImdQRzIT1XY7KXASShcLguUoCBU9F6L
	 PGMCHQzppcaFEB3KCxg1jd+WWZDmAI/FlDbTKU8ShbzWr3jj4yZZ3Vljtefg2stbHlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQzGMHKE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93EE606A31C
	for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 13:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A93EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQzGMHKE
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso494238a12.3
        for <netdev@vger.kernel.org>; Wed, 18 Nov 2026 05:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795009039; cv=none;
        d=google.com; s=arc-20260327;
        b=hawg1h2eA39sl9mpIrEOswe2KQ1QMjSvPtK3w9ERMOvm6LHKmuMIA+pZhqu1kHF7uo
         VaumiO0104hYSFDGvHhw4AGi4obJJL2RBsnGwC7z1+6CvKM1FfwwwbDEFRFvcL7+0ajq
         s2ttampoERKYcCMP7nMwOCxNUpeQEtiwHnNz8YcZO2j3kye0+t3CrcCbfeHQpdJ//D5n
         RvfCEfIXP9ketTFdIMkMun02wwsfziDAsuRwdk6U/jGXFFr33ICpwlEX50Rry8lYd9cZ
         lB5UxDze+2Kpjj2q8/le5mUDuQj6PDUFbP+A3wG6QG3/VIrK408GB71hr7H6WmOMLpfD
         5pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Pne64dTPZwiQyGJLnEYc8Ub7GDR3IIujV0fV2jCbvA=;
        fh=YTPxdiGiyoexVKzS03fKlXo1nqG3oQBqtP/GcCseRYM=;
        b=bRIcU4w8apI+eYyadrht4vkUQ5T+clNdVZb0/s0wyJVb3ttVv6384Lk74VIL5ShpmS
         Yzpj2waPL9tx9IXPSg3YWRFkaJiizRHWPhYm4EgqMOc+oOzsAGAuI5SXxqrI1B8CeMjK
         3gHEc1C3cKTxt8ctzfBXUvAr40U9wGSu4MwYmi91glsWVK7fIFO3/HAvt2XkP3ev7WhO
         Hy2kenhCJDtwqfP7fQhP2FjWCzmsRxKDycmz49MNae8QpPSGkf3BpmukK93gHQUvwzi0
         FWI6D95WtLx3sq4O+vAbX8JuTRGjMhZRzDOS3cXw+N05YFttuxc2BJ7dFX6sT37fdo/O
         sOag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795009039; x=1795613839; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Pne64dTPZwiQyGJLnEYc8Ub7GDR3IIujV0fV2jCbvA=;
        b=yQzGMHKEJROyCquvbV4qUTagObIHpoGve/NcUDxFpQYfDhxtnEg0IG5t+dSj3J7pVJ
         QAbQ22ps5zSwJFXhbt/kfd9X4N2ta7l4nSJkcXPhNJx6Sgs71LMgTtPRo0ZiP3Dx5+Kc
         FoIB7HltZ2Z1Pd2tUFTmJao2EWFsfGidpoBGGWW+fu+aoZpXfxjjVjWjlRAb8KT1lSl3
         WazlPd85fFGF50nyICnd6IV9SXdR2TCJCubsVqW19Okn3cIgMF0gVdZjAvhQ/S139SKe
         E4UmDwajDGx2VHrQLoCP5C0wbHm9HKlhXVoeqD0+VwOllLry+8AojExiSCNkxb9PN7MA
         dkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795009039; x=1795613839;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Pne64dTPZwiQyGJLnEYc8Ub7GDR3IIujV0fV2jCbvA=;
        b=xaRzTBD8FHJAYga/5IaPZegUaXFK5u0Fel0nZYCfg+M1KnefLjBUnUiZUx+MoSdlLk
         w/F7dw0Ubjar3BnOric43at46a01dTfhpcA+0zhOSXcRA3EsivveZ0qd3hq1ptsr3U7X
         uq3jSP71n9FH4F0GPNPbfmDA0U3gROwDwgSgTWC+Nk+hoXS+prgonJ5SRtp1sgtPz01W
         rK/MxTFsZZqdA1VmO7AY6V8Y9e4fxCsQ3fFKyDOnmp+g3Dpxg7EMvODZFaAHTJisl1P2
         nrUd61zlUGapBjpJeuLrq3sJdGFG3ZoABRNs4XR9tUiQH8qyZxjp/EhFFFs8oqpX5WZu
         c8dg==
X-Forwarded-Encrypted: i=1; AL+hErG5yA055OBVtZ2DM0YwJ3JjKi7bo6xFJXf2Ab6LQL3It+W3zXvSHEOrn99r8T1Mc86s0GhpJmE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9GwJosP1vZxAGQEbO25OBuRzcabvWKxf7X4IjlHgnCceQj/q97
	B6CQ9nnX6KWOCbpkC+5QVWWe04gNv2CNTiwLSgpMNvvacM8QeNm14GLYb7OScqvBal5UwRy5OCT
	1/U7WW1nTyqllN1uiL1mOSZ5rWO6BtjE=
X-Gm-Gg: AZFdTZdO/6Rgk5lP0Myq6tAuxhP5pfHSXuSGK6RduaiPevDsuEccUn5CnaBnyxbE8DK
	dIx1630gD8YOhxlaDW5iP6fUCdghewKSHKLKe0bHUQDsHngMx12a8o74fpXS+aoYiV7BrRSm+h2
	WOcW3tgGQ78EWjO31z7O9iPLwADAdWGO+Tmjfb5nyveKhX64+jD4zdW1uSnGnfUJJdialrsxa2r
	ayqtaz9ehlqlzegkFaXCiYzfbe2GCeH9wP21vagAh1bPoPd8xJ3fnOONgkEWRA9EMuulh3pDRRw
	JRs+gv+UB+9XkePMzgj2eijcIoiB5NqcNuXmowCsyHuDZt5ET6Y4gclzpEiYrQBXwPzX63xAP1D
	/1AW0k6lUAzHKtUjigkMZ96xjkoSlpE2PI89fBwmPJF64fmPhh/B08QIL9KDB
X-Received: by 2002:a17:90b:1dcf:b0:3b3:ae0b:4e01 with SMTP id
 98e67ed59e1d1-3b3d074ce68mr2508725a91.13.1795009038969; Wed, 18 Nov 2026
 05:37:18 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113231225.1864810-1-anthony.l.nguyen@intel.com> <20261118115915.116177-1-poros@redhat.com>
In-Reply-To: <20261118115915.116177-1-poros@redhat.com>
From: Magnus Karlsson <magnus.karlsson@gmail.com>
Date: Wed, 18 Nov 2026 14:37:06 +0100
X-Gm-Features: AclHuK8kWb7QpgODRzoYcPDh6yhYlBlMmtzxE4k3I08iqW3ixJVQ38vDDF66nYA
Message-ID: <CAJ8uoz0MMUx68rMZWoZs-JwjodpRixwQSrgpyta1NsanGPn=dg@mail.gmail.com>
Subject: Re: [PATCH net 0/6][pull request] Intel Wired LAN Driver Updates
 2026-11-13 (ice)
To: Petr Oros <poros@redhat.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, netdev@vger.kernel.org, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, edumazet@kernel.org, 
	davem@davemloft.net, andrew+netdev@lunn.ch, horms@kernel.org, 
	Jacob Keller <jacob.e.keller@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Marcin Szycik <marcin.szycik@linux.intel.com>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 18 Nov 2026 at 13:00, Petr Oros <poros@redhat.com> wrote:
>
> I think this pull is a good moment to ask how fixes for Intel drivers
> should flow, because it is not the first time a fix spent months on
> intel-wired-lan and then hit a wall on net.
>
> My patches 2/6 and 3/6 have been on intel-wired-lan since June, v4 on
> July 8 [1]. They were reviewed and tested by Intel validation there,
> and four months later Sashiko found real problems in them on this
> pull. I have a v5 and will send it once it is tested.
>
> Jake's E82x timestamp fixes went through three pulls before a part of
> them was applied [2], and Maciej described the same loop on the i40e
> pull in September [3].
>
> I know Intel patches go through iwl and are not applied to net
> directly [4]. But for fixes it means that the review which decides
> happens on netdev months after the iwl review and validation, and every
> respin goes through both again. And if iwl stops cross-posting to
> netdev, as Jakub suggested [5], Sashiko will see Intel fixes only in
> the pull.
>
> So does the iwl round still make sense for fixes? Would it be better to
> send fixes straight to net with iwl in Cc, and have Tony's ack and the
> Tested-by from Intel validation on netdev?

Glad you brought this up. IMO, it makes no sense for fixes to go
through iwl and it makes contributing fixes (or new
features/optimizations) a lot more painful. Sometimes even to the
point that you just stop contributing something. I am not in the NIC
team at Intel, but sometimes I have to do network core work that also
touches our drivers. In this case, that patch set goes straight to
net-next (as iwl cannot and should not take core patches), but any
driver fix that I find on the way needs to go to iwl-net so that it
can go to net and be backported. So the fixes that my patch set are
dependent on and that should go in first are instead sent to a
slow-path (i.e. iwl-net) and after X weeks/months appear in net and
then net-next. But my patch set in net-next is dependent on these
fixes so I have to either wait or just cross my fingers that my new
feature is stable enough even without those fixes. Not optimal in my
opinion.

So anything that could be done to speed up this process would be very
welcome. Sending fixes straight to net would be great. The validation
team could pick those patches up from the list and run the regression
tests against them, or would that take too long?

Anyway, good initiative. I am sure there is a solution to this that we
will all like.

/Magnus

> [1] https://lore.kernel.org/all/20260708125755.706263-1-poros@redhat.com/
> [2] https://lore.kernel.org/all/20261021-jk-e825c-timestamp-processing-logic-fixes-srcu-v5-0-72289a4ac8eb@intel.com/
> [3] https://lore.kernel.org/all/are4rBUJO3mzrkO8@boxer/
> [4] https://lore.kernel.org/all/20260721174642.7749143e@kernel.org/
> [5] https://lore.kernel.org/all/20260922112216.41e6f8cf@kernel.org/
>
> Regards,
> Petr
>
>
