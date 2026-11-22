Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795352555;
	b=KUtncUXpu2pDRBPP5i6ng+ff0O917BkGnlcyCr1DSBWb3DzYdjXae+p+GXhBAi0Vl4Uf
	 1bF43TTmm0nbXSY67WTnwl6jVHXUWf8LVpmQh3e3RaPoQOU8ACn1dIYQaJvRlb6x+w+01
	 WTHarqEwwGVsfH0sxxaEFqZCOV2ZZE/GlCj+bwqnyAySgjBjgux88vAgwSkQlNlatdWPo
	 cv4j+a4OODBGzSiMq5bLYjfPm+7qxgI31iXqDjZ+imse5cH7j97p5ZPGSP7rlyyUW79oD
	 2AlHho9xOlQabZNvd+zpmiBDgmWlz48DC1Rw0hC+pxeWP516P9gPTj0NxV+hd8WjU8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352555;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Ab/ahYb+D8PHWWcmTQ2KYtkHbZbbfYycn1dhmK2jBrU=;
	b=SRzyiSv1hzGwWI93x61H2C9AuRX4PLeV50T20blMZ9v9sWSQdWGrgRcTwhgmYF+83tTf
	 hHoMmDzDRbso/tb7Tznfw+FjzCCYgjvnobEF1zBVGaSi+DVqiHTrES1N+q3//WwmE0UmY
	 EF9gNN+yo/9COsfsjn9j1liRqvyLeDSpzTFm8HvgWHp4SviutkkjJkBxZBVrffsqyerP1
	 69XeBe7ntkTc2HgYBwqovSS9Z9Kbif87n7irqrNKeB17S7zJ5AVHMEpsQtZvleLEYwONB
	 0QfMRlucjvKdAwE6fp402Hb5/qLWs9EBPgo4LE8Mj2WSDNJAM7mjiDI9aKah5IuRynA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vqf5iMms;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E989D606A320;
	Sun, 22 Nov 2026 13:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Vqf5iMms
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34301F000C6;
	Sun, 22 Nov 2026 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795352554;
	bh=Ab/ahYb+D8PHWWcmTQ2KYtkHbZbbfYycn1dhmK2jBrU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Vqf5iMmsrMAYqIcpO8/6njH6L1Mq6oHdvgAL8i3VFDrsOkCsiwkeg/H4lCYumVRMC
	 j951gLzLZxjZ+ZuR71ZL1ujFGBD8VlvMz1NNNP6V8IdMjhtDU7oO8iL6iKHEizWRdP
	 hC7daoxexmuUC4IfoJLFdhIRwZ0B6R12q6blc3PHgMBmI5cPSy9eaTu4/owtv023gG
	 ogxIioHA106J/5cCmLWCcfn2ZXFYIUasNpUpcdqamUGkY2xHlkcmUnRI7JCa9OGQvF
	 mlX1jndjNm7Mq5iASNlEVS7UI7cE9Wd6Cl+sWw5TvhBXENquggwScusYcMUpJIc5TM
	 1F7qMz0Ei5Q1Q==
Subject: Re: [PATCH net] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
From: netdev-bot+sashiko@kernel.org
To: kyuwoncho18@gmail.com
Cc: netdev@vger.kernel.org, jv@jvosburgh.net, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org
Date: Sun, 22 Nov 2026 13:02:33 +0000
Message-ID: <179535255333.3135.10581087211469618015@kernel.org>
In-Reply-To: <179500849159.1877154.14715369660816392826@gmail.com>
References: <179500849159.1877154.14715369660816392826@gmail.com>
X-sashiko-severity: High
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The fix is incomplete.

--

bonding: reject a non-Ethernet 802.3ad slave even when the type matches

This moves the 802.3ad Ethernet-only check in bond_enslave() so that it
runs for every first slave, not only when enslaving changes the bond's
type. The goal is to stop the global out-of-bounds read of
lacpdu_mcast_addr in bond_open() when a slave with a 16-byte addr_len ends
up in an 802.3ad bond.

> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_main.c
> index 042d7c75548fa..f2e645f869b13 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -1959,13 +1959,13 @@ int bond_enslave(struct net_device *bond_dev, struct net_device *slave_dev,
>  	 * ether type (eg ARPHRD_ETHER and ARPHRD_INFINIBAND) share the same bond
>  	 */
>  	if (!bond_has_slaves(bond)) {
> +		if (slave_dev->type != ARPHRD_ETHER &&
> +		    BOND_MODE(bond) == BOND_MODE_8023AD) {
> +			SLAVE_NL_ERR(bond_dev, slave_dev, extack,
> +				     "8023AD mode requires Ethernet devices");
> +			return -EINVAL;
> +		}

[Severity: High]
Is this check enough to keep a non-Ethernet slave out of an 802.3ad bond?
It only looks at the slave's type when the slave is enslaved. A slave that
is itself a bond can still change type after that.

Consider this sequence:

  ip link add bondA type bond mode 802.3ad
  ip link add bondB type bond mode active-backup
  ip link set bondB master bondA     <- bondB is ARPHRD_ETHER, passes
  ip link set ip6tnl0 master bondB   <- bondB has no slaves yet

The second enslave goes through bond_enslave(bondB), which sends
NETDEV_PRE_TYPE_CHANGE for bondB:

	res = call_netdevice_notifiers(NETDEV_PRE_TYPE_CHANGE,
				       bond_dev);

bond_netdev_event() passes the event to bond_master_netdev_event() and
bond_slave_netdev_event(). Neither one has a NETDEV_PRE_TYPE_CHANGE case,
so both reach:

	default:
		break;
	}

	return NOTIFY_DONE;

vlan_device_event() only refuses this when VLAN upper devices exist. So
bond_setup_by_slave() goes ahead and sets bondB->type to ARPHRD_TUNNEL6
and bondB->addr_len to 16, while bondB is still a slave of bondA.

When bondA is brought up, bond_open() does:

	bond_for_each_slave(bond, slave, iter)
		dev_mc_add(slave->dev, lacpdu_mcast_addr);

but lacpdu_mcast_addr in bond_3ad.c is only 8 bytes:

	const u8 lacpdu_mcast_addr[ETH_ALEN + 2] __long_aligned = {

Does this lead to the same global out-of-bounds read as the KASAN report
in the commit message?

If bondA is already up, a later release of bondB has the same problem.
bond_hw_addr_flush() calls dev_mc_del(slave_dev, lacpdu_mcast_addr),
which compares 16 bytes against the same 8-byte array.

Changing the type of an enslaved bond seems to be supported behaviour.
bond_test_enslave_type_change() in
tools/testing/selftests/drivers/net/bonding/bond-eth-type-change.sh
enslaves one bond to another, then enslaves a non-Ethernet device to the
inner bond. In its successful variant, the test expects the type change
to stick.

For comparison, team_device_event() in drivers/net/team/team_core.c
refuses this event for its ports:

	case NETDEV_PRE_TYPE_CHANGE:
		/* Forbid to change type of underlaying device */
		return NOTIFY_BAD;

Should bond_slave_netdev_event() also veto NETDEV_PRE_TYPE_CHANGE? That
could apply only when the bond is in 802.3ad mode and the new type is not
Ethernet, or, as team does, whenever the slave's type would no longer
match bond_dev->type.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/179500849159.1877154.14715369660816392826%40gmail.com
