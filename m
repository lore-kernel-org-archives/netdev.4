Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795582289;
	b=zJQUMhJSmIjsGWtEFEENI970g64X1RikNOUU+niy2XNQkxiIP1rlVl9165yerHffalVW
	 61FAAVGn62I9GvHFpkFZqDcb6Xvtdt+QJ7BQ0WE97edMxhsajux/pKVy71Zc+5tWBvl23
	 CCiaL74Ugb58Qji9UeZHfI4KlckHLuzsgu9ogTWrFx9IRXxMCUD/bHtPkRvZr8DeD5+o1
	 OoHJ/aCaW/cM2mWfNWrobczMDTcoQhIN3TuAluYZTm7+zekHI7qRvSNvLXgUyUFR35pKO
	 cmA/BNrQP0vDm46pQJh7fOPssgNCUtsBKxY8v0cWsfGYCT3AxuvfLEKi0xsYbLinoVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795582289;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Message-ID:
	 In-Reply-To:References:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Importance:User-Agent:X-Mailer;
	bh=jIG/kkVKqgpvZnl6KVS9gjEkqn34x/1vAAY9Ak44MSk=;
	b=eCDaTeioISfTyV1RMknTAZHXP1A3WfrHXrwu9fTPyfUaNcRSIbMXRMPfvxC5anc02OUK
	 oI9ZGxMLVZuLLuYyVJGbEboMGrOqJqUym06EfntxOCM79RmmuOEC3CH7Nqw3sERdMfGRn
	 bkQu/eGbOCyhKnr+QpxJe7hP8yXyWBXZKugqsLDVMymtoJsePebUtjZM41dJ+YoXG9iDN
	 Ia5S8R1KitAaPDHI6nqXpagnaqPz/btIQw+t4RslVHsPgDcjpWrJkZHGqE4Ma5u/jiYfr
	 nLqxTnEAPmln/c66RhnJvu/Alu4YQ3BaQk2VoxHmOZ2HnMC05GFtK385xsNgDNSMEfQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mpiricsoftware.com;
	spf=pass smtp.mailfrom=mpiricsoftware.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0B9606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 04:51:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B0B9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mpiricsoftware.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mpiricsoftware.com
ARC-Seal: i=1; a=rsa-sha256; t=1795582267; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Pfgt/5wgbuEvoK5KcGO5fNdgMt6NdKZ2mB8RkEIC87Ggt2l1YKjL6w0UO4q8aiRva2y8QJP8WYOZT5j1b50yevvIaRIqgrfcg9oXZIE9rNSf8A26Bsyhj2sUlDRvf6/magNdddzdovUDW2bhFwiCbFsw0t3d6TOkqffME+euLds=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795582267; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jIG/kkVKqgpvZnl6KVS9gjEkqn34x/1vAAY9Ak44MSk=; 
	b=NgXvVaoC/N4LWjXWY4Oujo4KmvIi8pmoIUhPavMrypWRV6YLYcAdcuTTJU87sazZZkUo4VbdhJ73/UajUgMcumTKtfTe8GT1iMlJrRijTzWxGQJ7fPWN1CTcO3fTzWw0ZdKDKGhJoW4FwSDh8oukt/TJLXuFLCIs28/BRNcALEw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mpiricsoftware.com;
	spf=pass  smtp.mailfrom=kalpan.jani@mpiricsoftware.com;
	dmarc=pass header.from=<kalpan.jani@mpiricsoftware.com>
DKIM-Signature: a=rsa-sha256; b=Mi/mG6LNUv2xLNsivOIt/JnyZLGmeOhyuz1lLHY5ikYp9fnE63HDwYDrBfJTnUrVyYctybVEmE/GeTzCXPo1cvWTwofdhCktu+RA9JSDJE4wnNiJOo9FGsZaso6tcpfZJjG04ldqNBXJOOg537GUTw8122jy2K+2cReN11jSbqk=; c=relaxed/relaxed; s=mpiric; d=mpiricsoftware.com; v=1; bh=jIG/kkVKqgpvZnl6KVS9gjEkqn34x/1vAAY9Ak44MSk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 179558226238488.94232647218337; Tue, 24 Nov 2026 20:51:02 -0800 (PST)
Date: Wed, 25 Nov 2026 10:21:02 +0530
From: Kalpan Jani <kalpan.jani@mpiricsoftware.com>
To: "Matthieu Baerts" <matttbe@kernel.org>
Cc: "Dominik Maier" <dmnk@google.com>,
	"Mat Martineau" <martineau@kernel.org>,
	"Geliang Tang" <geliang@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>, "mptcp" <mptcp@lists.linux.dev>,
	"netdev" <netdev@vger.kernel.org>,
	"dmnk+artist" <dmnk+artist@google.com>,
	"Shardul B" <shardul.b@mpiricsoftware.com>,
	"Mpiric Private Limited" <janak@mpiric.us>
Message-ID: <1a2110afc5e.30756196125300.3918439705196063429@mpiricsoftware.com>
In-Reply-To: <a9526d12-87db-466d-aac8-ae575559e010@kernel.org>
References: <20261119192159.2646113-1-dmnk@google.com> <a9526d12-87db-466d-aac8-ae575559e010@kernel.org>
Subject: Re: [PATCH mptcp-net] mptcp: gate diag sequence counters on
 CAP_NET_ADMIN
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hi Matt, Hi Dominik,

I tested the proposed change on a locally built kernel with MPTCP enabled.

Runtime testing passed for both client and server sockets:
- Privileged Netlink requests return the actual sequence counters, matching getsockopt(MPTCP_INFO).
- Unprivileged Netlink requests return zero for mptcpi_write_seq, mptcpi_snd_una and mptcpi_rcv_nxt.
- Other diagnostic information remains available to unprivileged users.

The full kernel build and runtime tests completed successfully.

Tested-by: Kalpan Jani <kalpan.jani@mpiricsoftware.com>

Cheers,
Kalpan Jani


From: Matthieu Baerts <matttbe@kernel.org>
To: "Dominik Maier"<dmnk@google.com>
Cc: "Mat Martineau"<martineau@kernel.org>, "Geliang Tang"<geliang@kernel.org>, "Paolo Abeni"<pabeni@redhat.com>, <mptcp@lists.linux.dev>, <netdev@vger.kernel.org>, <dmnk+artist@google.com>, "Kalpan Jani"<kalpan.jani@mpiricsoftware.com>
Date: Tue, 24 Nov 2026 16:47:10 +0530
Subject: Re: [PATCH mptcp-net] mptcp: gate diag sequence counters on CAP_NET_ADMIN

 > Hi Dominik,
 > 
 > (+cc Kalpan)
 > 
 > On 19/11/2026 20:21, Dominik Maier wrote:
 > > In net/mptcp/diag.c, subflow_get_info() restricts MPTCP sequence-related
 > > subflow attributes (rel_write_seq, map_seq, map_subflow_seq, ssn_offset)
 > > to callers holding CAP_NET_ADMIN in the network namespace.
 > > 
 > > However, mptcp_diag_get_info() unconditionally exports mptcpi_write_seq,
 > > mptcpi_snd_una, and mptcpi_rcv_nxt via INET_DIAG_INFO because
 > > .idiag_get_info does not receive the caller's net_admin status. Any
 > > unprivileged local user can therefore dump or query cross-UID MPTCP
 > > sockets by token via SOCK_DIAG_BY_FAMILY and read live 64-bit MPTCP Data
 > > Sequence Numbers.
 > 
 > Thank you for this patch!
 > 
 > > Emit INET_DIAG_INFO from an .idiag_get_aux callback in mptcp_diag (which
 > > already receives net_admin from inet_sk_diag_fill(), while msk never
 > > sets icsk_ca_ops so netlink attribute ordering is unchanged) and zero
 > > mptcpi_write_seq, mptcpi_snd_una, and mptcpi_rcv_nxt when !net_admin.
 > > getsockopt(SOL_MPTCP, MPTCP_INFO) for the socket owner and token-based
 > > lookup in mptcp_diag_dump_one() remain unchanged.
 > 
 > Oh, that's a good idea, I didn't think about .idiag_get_aux callback.
 > 
 > Kalpan was trying to fix the same thing:
 > 
 > 
 > https://lore.kernel.org/20261123054324.561321-1-kalpan.jani@mpiricsoftware.com
 > 
 > @Kalpan: what do you think of this? If it looks good to you, and you
 > tested it, can you send your Tested-by tag?
 > 
 > We can add:
 > 
 > Closes: https://github.com/multipath-tcp/mptcp_net-next/issues/445
 > 
 > Cheers,
 > Matt
 > -- 
 > Sponsored by the NGI0 Core fund.
 > 
 > 


