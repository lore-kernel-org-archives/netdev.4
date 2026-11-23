Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456917;
	b=G/DAohn+ri/dlSeQ6oIki0C+jGm3eSGi2iDgDeO0iKMOzjf/bOJr8hVF9fSX2seHlbM8
	 LbpIZsuN5LSvpDhkwYYBO1DqrpFDvlcA0PGHXJ155/Pc28+0I/X5KRqG1IoLg+lAstgfy
	 8dPttGSfX1o4S4WC0yJ1GvlyeVwMjYE14PFUrZD6ZZFR99aoxxIQ+BbWjE50iwnaBvwv4
	 +91MrtkaGtFQ0c4RZqPgUsMFM+bcDTHSP38o68M4Y9y6NRKp28vSiulKzwMj2HlTa8zVB
	 /aHBapoGj3tEDH8wiWDxmpFLj6uW9QVPOW/oqJcGMz8NJBHADOWdzEvPfHa4MHVLO7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456917;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tMSmWi4PmO8P9evCtaCCqvLcTiNowVONOK61eDxOosg=;
	b=DkGNrkX+ulzIbugNKlhQ2MQrxAZif+1RUohgzA/N7DdiLNirnoRhrLUh7Rhabl4r2OOp
	 B8yT8CPKY0iHO+nU3dSpMQouum6S7/KSMtJ1AvbRUP2S5YDyvBgc7dCIF2ScydL+EgLEg
	 omTQ5JgHg2BTR719twnjiKP81kQGzpFY3z9oxmFvphTvjsOOAu7lcxay3YJLA1UNxqRBO
	 KaiIQIo1qKec2g17kDjK31h3/oMopgXCdAweNi4oWEp7RlMwsQWXbQi2Ebv02Nxg6WUHr
	 3moOJ+tgR8C0IRDA1GpTxYIb794b7qPpM1llkWmU2au2ThFIAM3rW1HIXywiZCQGb2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eG5+Frx8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12ADE606A327
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eG5+Frx8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 681351F008B2
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 18:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795456916;
	bh=tMSmWi4PmO8P9evCtaCCqvLcTiNowVONOK61eDxOosg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=eG5+Frx8GVX/c/z8PXyzsWlQ3dvQGju5CuqfTFpLzNVh+WruclO4HH56q2lKR2BGy
	 dMNPyKR51mAo2/u2nFEqWnnJu6kEN9eRGjEey8NNwMGdm+NRB6QrK+Iv+q5iihp94Q
	 MfyhCylceSyDzCMbJl3gsDLSMTbF3VHlFvP7jz8bptuQmcE1NqU7rUyHne9kvB4uCC
	 xl4xv41GxPWNfzdlMM5WvR0M10oZbuSLwebreh0awE1Ul52jly2/6pJs1jvdBbHNUi
	 +Y99pwWxYzhLIHNWgUhDkaJv6uDeX+PeVnEMqFx/HdSisjNSMuCNS6suwP/4rIqu2D
	 qQ9EtNMh7thxQ==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-43bf9548df4so3375507fac.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:01:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHa8xSv6Hxii4uH2y6zJMRiITBJV+BMurBg2uLo/FtfcipLOUKI6p1Cj5YGFs/M4w7ad+fHa/4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8i5CdJyZrMYFZGIcrSzDUCL08rYCnJNjOOOoi2cExDWbaSKRxI
	EHF4qviNpRWNsLpO1e6cugZ+/HiTJnVi59XhJWrQC0luaiBpDdLLa/W1Vyh66A5QnhwbQNxH3K2
	6c8eOpkiWnPhRkStXGIpo+Fy0s6PqG9A=
X-Received: by 2002:a05:6871:4396:b0:49e:472c:6b12 with SMTP id
 586e51a60fabf-4bc860f9b97mr10968896fac.52.1795456915652; Mon, 23 Nov 2026
 10:01:55 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261120134548.214126-1-mdshahid03@gmail.com> <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4> <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
 <179544969959.175192.4403952228876691788.b4-reply@b4>
In-Reply-To: <179544969959.175192.4403952228876691788.b4-reply@b4>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 23 Nov 2026 19:01:44 +0100
X-Gmail-Original-Message-ID: <CAL4WiipNiCm9nBMt+ZB1+U3o9j8KY1L2Lo0vKb5QHORpBgDCiA@mail.gmail.com>
X-Gm-Features: Aa3M54pP93d9ftwDviKwv8Mss2IlcC8MVW5kDbHlRC_286VLxTw7dgxd5mF-bYc
Message-ID: <CAL4WiipNiCm9nBMt+ZB1+U3o9j8KY1L2Lo0vKb5QHORpBgDCiA@mail.gmail.com>
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in rtnl_get_link()
To: mdshahid03@gmail.com
Cc: Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 23 nov. 2026 =C3=A0 17:02, <mdshahid03@gmail.com> a =C3=A9crit :
>
> Thanks Paolo.
>
> I think,I may have misunderstood this part from NET documentation guideli=
nes:
>
> "The commit message must disclose whether reproducing the issue required
> modifying the kernel (e.g. inserting a delay to widen a race, or[[**writi=
ng
> a loadable module to issue the right sequence of calls)**]] or using erro=
r injection."
>
> I interpreted this as allowing a out-of-tree test module to produce
> an issue,provided that it uses legitimate kernel APIs.
>
> 1.am i intrepretting incorrectly ?

Yes.

This sentence is a disclosure requirement, so that reviewers know how
much weight to give to the reproducer. It does not say that any crash
obtained this way is a bug.

A test module (or an added delay) is fine when it only makes it easier
to reach a state that the unmodified kernel can reach by itself, for
instance to widen a race window, or to exercise an in-tree code path
that is hard to trigger from user space.

Your module does something different: it creates a state that no
in-tree code can create.

rtnl_msg_handlers[PF_UNSPEC] is populated from rtnetlink_init(), which
is built-in and panics if the registration fails. Nothing in the tree
calls rtnl_unregister_all(PF_UNSPEC), the only callers are for
PF_PHONET, PF_INET6, PF_MPLS and PF_CAN.

So the PF_UNSPEC table is never NULL once the kernel has booted, and
rtnl_get_link() relies on this.

This is what Jakub asked in his first reply ("How can this happen?"),
and the changelog should have answered it.

>
> 2.This is general question ,i mean ,we can litrally crash the kernel
> just with loadable module ? How do we distinguish a legitimate kernel
> bug exposed through a test module from a crash caused by an artificial
> or unsupported sequence of operations? is this not vulnerablity in a
> way or design issue ?

Of course a module can crash the kernel. A module runs with full
kernel privileges, it can call panic(), or overwrite any memory.
Loading one requires CAP_SYS_MODULE. There is no security boundary
between a module and the rest of the kernel, so this is not a
vulnerability.

Exported functions are not hardened against callers misusing them.
We do not add checks for conditions that can not happen, they add
code, and they hide the invariants from people reading the code.

The question to ask is: can the unmodified kernel reach this state,
from user space, from the network, or from a device?

If yes, you should be able to describe the in-tree call chain in the
changelog, and in most cases to trigger it without a module.

If the only way is to add new kernel code calling an API in a way no
in-tree user does, there is nothing to fix.

Note that clang-analyzer does not know about this kind of invariant.
Its reports are a starting point for an analysis, they are not a proof
that a bug exists.

>
> 3.Don't you see a gap in documentation w.r.t testing with loadable module
> in details.

Not really. The documentation asks how the bug was confirmed to be
real. A module unregistering the PF_UNSPEC handlers does not confirm
anything about the upstream kernel.

>
> I am asking because, like to understand the correct approach and apply
> it to my future kernel contributions.
>
> Have a nice day !!!
>
> Thanks
> Shahid.
>
> On 2026-11-23 11:56 +0100, Paolo Abeni wrote:
> > On 11/21/26 12:10, mdshahid03@gmail.com wrote:
> > > I tested this issue on both original and patched kernels in qemu.
> > >
> > > First, I used a test module to unregister all PF_UNSPEC handlers.
> >
> > Just in case the are any doubts on the poic: if you need a custom
> > OoO kernel module to trigger a 'bug', it's not a bug.
> >
> > /P
> >
> >
> >
>
>
