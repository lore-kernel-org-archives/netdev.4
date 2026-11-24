Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795483481;
	b=M+UtbE+tPSreLQ8/UUkYewSZJMq7IrjkOTQfRNfCqTygP+9IVupUPDvIb+pJPCDb49TQ
	 cgRrywWABAeSn03mOdmntA+zeqGVgX9y9FzSfq/EDMfwz8C6bnEPJ/mgQOW7eYeMUs7Lu
	 /LUopvhnhgs/HOpHNufYmo3Gf7LKRze+0vPzdXdkLYnQvR+ImrT8P8pS3e0B1NLVRUbS2
	 p2v10lNvs6dcNkpfjzMYZ2trdhaIMJyfmkxaDOQyIu/R1nEchFlAWrB5Y5bZOmPnI739Q
	 5J7nnr2HA8VwW7O6H/6hjy2wXOANbYWTfj/bq82G6R1adwt696c2jS2UNZsBCxj//eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795483481;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=hibdDoFrDA2JztbQTk0XwP1hu+Ge/YpsEJFH6Cwz8aA=;
	b=ZW8mN8isV4soUzuy9nKdTWwuNCYU/j17FxIP3HAT3Wj8F10eAZYKIF21iRoafqn+MX++
	 1WwKejjzTuITM1Ghf7dDl+noAX3mF2PskCX5r4Z2rji+4Q07Ceb7CVzuDzkGb5bl1nW7w
	 zkvR6kECLT9+cLlftisp4+Uz2s+Qhxc+P7KD1VFDzMDlzxOCfEPYhsg2obvRfcbmxj5iG
	 zm2Y4uXGyAzJxYxTAEp/DdiMMPaMV/Dg7Jm9V24W8Q6sl6GeFj7CNJmSXUv6p3GGNCMRG
	 hrvnSe3kbSaABMy7xstyiAezSm5U0e17cVPEDejKHAo65373kHVGH9ow8+u7du8vnIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKjRs+mo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279D606A331;
	Tue, 24 Nov 2026 01:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fKjRs+mo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA27E1F000CF;
	Tue, 24 Nov 2026 01:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795483480;
	bh=hibdDoFrDA2JztbQTk0XwP1hu+Ge/YpsEJFH6Cwz8aA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=fKjRs+moeCRVt6naDzolk1zxkM6pliH0RQGzh55SvdWE1YnmxbezWaLz4LjtAocBr
	 2q0IItT6qUbB6P3bSJ3lkAME0yQDiZq2fnQyE4E0D5WyRRB2+c01z82ncWDz8xpodx
	 A2EDLKlUTHLybyiUGJz2Hf0om+/gNJ7vQVfH6vLV7ubKqqI7EjOOcV5skbBAhL3+iy
	 +dpqqKh3oIgFJIrs5i4H4+ffgG3uLN4WxluPLnRcSDQeyEqchkyHkKdPs+YW7CSoVO
	 NocklNqvYsI0syAVuad8AeSe9U6oAZx4RiGgngaVwIvVI4PZ/lyrjNsGk1jKinOTXx
	 PnYA/drKJ8sDg==
Subject: Re: [PATCH net-next v12 09/13] net: dsa: realtek: rtl8365mb: use raw
 VID for PVID on family D
From: netdev-bot+sashiko@kernel.org
To: namiltd@yahoo.com
Cc: linusw@kernel.org, andrew@lunn.ch, olteanv@gmail.com, kuba@kernel.org,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 linux@armlinux.org.uk, luizluca@gmail.com, maxime.chevallier@bootlin.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 alvin.sipraga@analog.com, gusfmora@gmail.com, kuncy7@gmail.com,
 fabianotassotti@gmail.com, gabonpivovich@gmail.com, contact@c127.dev
Date: Tue, 24 Nov 2026 01:24:39 +0000
Message-ID: <179548347940.3135.10925296228835177150@kernel.org>
In-Reply-To: <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
References: <d966bcfd-1718-43b5-a2cb-ee5932bb361e@yahoo.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The PVID reset hook is split across two patches, and neither
  commit message fully describes its own part of it.

--

net: dsa: realtek: rtl8365mb: use raw VID for PVID on family D

This adds family D versions of the PVID helpers. On family D the PVID is a
raw 12-bit VID in a per-port register, and there is no VLAN MC table. It
also clears the family D PVID registers from rtl8365mb_vlan_setup()
through a new vlan_port_reset_pvid hook in struct rtl8365mb_family_info.

> Add the family D implementations of the PVID helpers,
> rtl8365mb_d_vlan_port_get_pvid(), rtl8365mb_d_vlan_pvid_port_set() and
> rtl8365mb_d_vlan_pvid_port_clear(), which skip the MC table. They keep the
> family C frame filter handling and rollback on error. The shared code
> reaches them through the vlan_port_get_pvid, vlan_pvid_port_set and
> vlan_pvid_port_clear pointers in struct rtl8365mb_family_info, so it
> needs no is_d() check.

[Severity: Low]
This isn't a bug, but the list of new family D helpers leaves out
rtl8365mb_d_vlan_port_reset_pvid(). This patch also adds it to
rtl8365mb_vlan.c and exports it through rtl8365mb_vlan.h:

  int rtl8365mb_d_vlan_port_reset_pvid(struct realtek_priv *priv, int port);

A later paragraph does describe clearing the PVID at setup. Could the
function and the vlan_port_reset_pvid pointer be added to this list as
well?

The hook is also split across two patches. The earlier patch "net: dsa:
realtek: rtl8365mb: refactor PVID handling" adds these pieces:

  - the vlan_port_reset_pvid member of struct rtl8365mb_family_info
  - the no-op rtl8365mb_c_vlan_port_reset_pvid()
  - its prototype in rtl8365mb_vlan.h
  - .vlan_port_reset_pvid = rtl8365mb_c_vlan_port_reset_pvid in the
    family C info

The message of that patch lists only three pointers and says "No
functional change". Nothing calls the hook there. Its only caller arrives
in this patch, in rtl8365mb_vlan_setup():

> +		ret = fi->vlan_port_reset_pvid(priv, dp->index);

Would it make sense to either move the hook and the family C stub into
this patch, or mention them in the refactor patch's commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/bc42ae96-dc7e-4b6e-b9cc-64cde5dc51ce%40yahoo.com
