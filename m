Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795563095;
	b=TeCMTVo+6JLGMa1rY6XPyxMc/obG1ix4DxnonSbmnCLLqxXUKKPo0k21k1OR9TjxFODf
	 q/mOwB1vvIR2yg7IQ/qi/PVfuSZT/7rtB9E71xenFU97zF7KHbVNmjeWQh8tPiQJ1fF0L
	 i8Bcfz6nGjmnQ+Epcr7TPwR/bzrwT2x23GSmOyVmtpmhtMbMo2E24/3He6ALEWT7LPZBM
	 I2CymXkWHsqU/b1n6pIrgPrV7po+sEnI/h5w+4ZOl7k2JGB6DnpljGcjeFrpxvzVZG7/p
	 qX0fNsa7P6H0vF4rYK0NunVaP0r/w4PfJPoEmJZEh96PqtEiRNQZ3PvMVElHvC/fnFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795563095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=OKIVDoQ6IbjrbJSFAkyn2r8WUZW+fQ5wkN0UYjtVEY4=;
	b=dfCzi/MWd14csLI9LIlTfhVC2qCWQmulIwH23/VNwpAcSolUatL5wxTQgNU57gOgHKU/
	 3XFqjClESxYj0R06VM25b5nPiuw3fMg1QDqDf8OigxFNvEFlq2nS3mw5yhGWlLhAFthd7
	 HBfT/s7v6Z0Oe7MNrKEyutW97n9t8EHTB6ulsoeX8LiGyrpmiYJC6rXhS4aRXlK8cb3/x
	 NlM+O4eNDdTultqaz8F+KQw3elQjmoXYCb37SQWSakRIsBU1M4kWLS5NF9nMJfV0xodkW
	 s62sy2VA1RU/T2NWHXLlfE7/3Bg7yjt7fC/kqjtyCbJzezpRnmCkul7jyEdzpvLfnYA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=OWNmR4bQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E116606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E116606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=OWNmR4bQ
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8ca6a12efd9so1540933b3a.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795563094; cv=none;
        d=google.com; s=arc-20260327;
        b=e4CXR3Xtn3fCZsN0/2fTyjEGT7JCCmQQpNKD3OcT4OyN7FJrF0riSNvkTbmKBvNbwb
         W3sRslVs0RX2D05zWs+Y4VOkYJcaPPZ/bdQwXYdKfLd+FSDG3VxHh1oAh4UQfnRjTO27
         5THXy630m+EzvQkYc1Qf/L+bR8sBW7K5t+8yDTZWqCAdciohdNtx2t/zXKPS9Cd80fzV
         pCextuHeWlewOiLCbFPmfbiV8jNlAujvJl8aHGoJiYv/sY1/9n3eHgDkDEq6nlN3qRnz
         6pQYCmU1E8TzQuBxf8JmfsoOpIRUDORUJQAhZK+VpZ0Wmx9WG3IE9kM5yUErphzMTM8y
         u13g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OKIVDoQ6IbjrbJSFAkyn2r8WUZW+fQ5wkN0UYjtVEY4=;
        fh=PYIchOZGWOuZpmfxVqkrBT0E2lTWboajEgt+Ik1kC/E=;
        b=lODvYELsg8qkb50m+o6ov8tTLQ68H9fI41G+1BGQ/LT6oxRdCrV+kejw0FdAA58U3r
         Hym8sieEy2Q9Gus/P3rZ0QXqpb5MK81CNFkAigT31iDBAj4a1A6yRnw91MN6KeXKR0Cz
         6sMpW/tNsjgPMCAfw+UFkWU7Yi5jmuSn2DAK+K+hkH54xM4H2Wne6qOeMJfQdHndsLZw
         1wGZXCszNPZOaU6NsI9KmZS1HScbf4HoLpX+Aw7sfdy+rsl7s5gQxz3kK7D0iP1JEPeP
         jMOcmk13sOVqB8JXh4+IiDz/onpwYZcIJejiMF0OlaR+imh/KLRoq7i3IbzWj9mZUCXe
         Bhcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1795563094; x=1796167894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OKIVDoQ6IbjrbJSFAkyn2r8WUZW+fQ5wkN0UYjtVEY4=;
        b=OWNmR4bQNuAY2g8kn3mBIKMy1mDBz5BqS5/LTU5OFQyzDO4CHsNkaczpxT16SbqhOF
         aAR2c3qhiE3pTNOd7NMDyF7Zgv7mp8W9tixXX5dUCwy47PMIHFy8wfnilK7npcisz0hI
         p+aSstV/JJpBGjRY7jpdgIwyq9pAim4oZ8kFk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795563094; x=1796167894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OKIVDoQ6IbjrbJSFAkyn2r8WUZW+fQ5wkN0UYjtVEY4=;
        b=dGMCYcH4ouTNne9mXlmv0eWg2sAtS7027Y6UtQpWOqkNd2Zc+OOh5kH30Pq4IDfAqj
         nZd4DA27JfKHNkPtfXG2OdVbIj3VHrlovjZcTOE2ZddJ4wBAXqpYXYmbrEZ5FfVM46DW
         /fxU9asMKujz2JrzvtYwThgWBO0w3kPW5nwu8iUBGw5/iJuJ+ZNBdbsm6tXNEH1A7m1t
         oRhenBUb57Ia1+LFVycZLHPyR5+RA3P2nOB6AfsQwznFhLXZbzYFnU5qIVGnk9pK19Rp
         RktsbKbVFZ3LsD0qaGufQ4vxAKSHc524o++gE+98F9q3ySrIN9jBr7pP+WKzxJpOU3Gy
         E70Q==
X-Gm-Message-State: APuU4Z/yeICaW9RACkBcBhcE7nwX7ZAH0YZucVtVETo3S1kFcnCqghA1
	aZHiNnMyfBxbcOAVDwItz/AwysPdWibTryefh6p/iMMVAv6nmMFxxuA4S4VNUCDGUcaGBNQo9MZ
	J2lL/Srw31xC41jVPb373Bi2oO6eQnkNkcMIrSqUL
X-Gm-Gg: AZFdTZe3e1AKj63bYFDN2gdOGY06qZ1MVGj102ZkrgHl9svxLrU5+7P8szuj9TdnmNS
	l89M1vdfEuRoHAP7AOyJJ5g85o+Mx0uu9wSupGWN3Y34AfKNORjgNHieAC27A+aZLvV/ct7OnCk
	O0BeFYsBEEMT9yyCeK4aq0npgd+8HDT7HCSEeRZqHX6OdbljiooNupmwYFLfqdwJEsd+6yEnDsr
	C0NS+oEMNVaIXUTohiDOC3gMGaz/oD9Ebi1zwkXgFSvFNwy1eDKc1h/Ujo08b4IoT9C89gxgpS7
	CMiJ1N+ubIOYee983bpXuFn2gXt8fP9zPF/zOQ3Cmq8wW7fN+gPU6oL1glr5dL+nzQVDWLONs6Z
	xvue6/UQgfYMAl6NGS2J5i6LBcICS867upowg4dLL5x7y5+aoL1qS9RyEDoi26dMK/USy0MSirp
	qY3h4SWPu6CC2dG9Q=
X-Received: by 2002:a05:6a20:a108:b0:3fa:f23f:a1d1 with SMTP id
 adf61e73a8af0-4014df5edebmr15730791637.75.1795563094342; Tue, 24 Nov 2026
 15:31:34 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <ACT-WEXM.v4.r0.20261124074514@mojatatu.com> <ACT-WEXM.v4.r0.20261124074514-1@mojatatu.com>
 <DN3PFJ14HKX6.1W8QEBXWGFTHH@gmail.com>
In-Reply-To: <DN3PFJ14HKX6.1W8QEBXWGFTHH@gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Tue, 24 Nov 2026 18:31:22 -0500
X-Gm-Features: Aa3M54p0BIuXeFK1hQe6wGuidNpnYhDPisOyEEe-Ji5-LRTxpCvmnGc2U6AgJTE
Message-ID: <CAM0EoM=rNfC8O0+XVBTaCFX-NNf9TGp9scdETqju18PVaG=_dg@mail.gmail.com>
Subject: Re: [PATCH net v4 1/3] net/sched: act_gate: bound the cycle time and
 start time arithmetic
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: netdev@vger.kernel.org, Jiri Pirko <jiri@resnulli.us>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Willem de Bruijn <willemb@google.com>, Simon Horman <horms@kernel.org>, 
	Victor Nogueira <victor@mojatatu.com>, Po Liu <Po.Liu@nxp.com>, stable@vger.kernel.org, 
	syzbot+0054fed3dc9085390f51@syzkaller.appspotmail.com, 
	shaos <shawnq1@163.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 24, 2026 at 2:57=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Tue, Nov 24, 2026 at 06:12 AM Jamal Hadi Salim <jhs@mojatatu.com> wrot=
e:
> > Conditions to recreate the bug:
> > CONFIG_NET_ACT_GATE=3Dy, and CAP_NET_ADMIN in the initial user namespac=
e:
> > tc_ctl_action() tests netlink_capable(), which checks init_user_ns, so =
a
> > user namespace of its own does not help.  iproute2 parses cycle-time as
>
> Well ...
> after "unshare -Urn" an unprivileged user can add a dummy device, clsact
> and a matchall filter with this gate action.
>
> That check covers RTM_NEWACTION only.
> RTM_NEWTFILTER creates the action too:


True - based it on poc i could create; should have checked that code path.
I hope the over-hyper bots dont complain this is "high" and have me
resend to fix the commit log.

cheers,
jamal
>   rtnetlink_rcv_msg()            netlink_net_capable(CAP_NET_ADMIN)
>     tc_new_tfilter()             no check
>       mall_change()
>         tcf_exts_validate_ex()
>           tcf_action_init()
>             tcf_gate_init()
>
> Acked-by: Alexei Starovoitov <ast@kernel.org>
