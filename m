Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618385;
	b=OsJgZluH1D0+xwX5KUtdAQtl7UyaZQft9QhG4djJ3OJGvPhIKjK4/nd4pj1R823RiSD/
	 /fc6ArZkk+vEQxmAeYuhsmUh4od+g8TrgtjnIxTqv/ksp+bcTpKruLpAhTvZziwzhcRvP
	 9ivS4vVFO8Me+OcL+NMRR6k7bYW4+R4c2jVe7TGBMZcEFotU3VKGL9eIXoW9vDLmshl1Y
	 inU21zWn791uaVi1Hnm/GTiSIJ6RA8odKC8JzQoMstJiOV2/1cGuv0jokhsU8oDMSTjmx
	 psCP0je0f20ojQLz47z7qwJHfKMJilt5ISapow4mUAh8f6VdBJDmoHRpubzbZJvQTfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618385;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=EfU8elc+Q4XX6fQbYKyo0mw957OICNoTDhNirXQd4AM=;
	b=JNtu7ScxlHqn0dNIhx/ErnuVmFJA3lWU3dMhG5egdGbIsuBH5M2l9dvk8jMOSzG0oHTM
	 Y549Qz9+oMWd+BTg/YET9ooFAqygi731/GkKni2u7vSfKIzY4HqVx7dMI+cxYe9mxR94D
	 XkNALGQ2ECTQf5k85+DHUBn/meS+onGBThwMLNlfU3kLGzWquwcW94PXGuaAFBfHDhNvJ
	 6lXk0BnsJmXnY9o0Sv95KiruDakH1I2ItT6qCGVueMU837NmIXr1oMiOHlsW5x1dlQ+Oq
	 aWEuZwquUjvD5VYS8m1IiCTOdMUNVKh9klMJjxXhLth+tHeGwDjFiJy4hIfxFFB5I/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5Dm14TD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282A3606A33C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k5Dm14TD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6E31F000D8;
	Wed, 25 Nov 2026 14:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618384;
	bh=EfU8elc+Q4XX6fQbYKyo0mw957OICNoTDhNirXQd4AM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=k5Dm14TDKhrUr1QSNfVnOAW+ozEPhW7cDWu0lloGhyzoVZABIL6vTuWQ2KkwqcWh8
	 GYQprJr9NfmX6KXsYrC6ce5RLnedrle/Z/BSVwErEVbzG1U0QGaJyd9F9qFTuE/3iG
	 1yRRdlJ8dzJvrEPAuQzrggOTc2v8u9udv/6D0NlbauwlL1tNtvnHbSQltqtShAgWEM
	 DIfgVFWDKwP+jeQd0u+vwHvUpA79lcIImPHB0BCKxirJZ9Fiquq5rp3NBk+3yLV/99
	 zQtno6REjhYyhRbRuxN9ZUEUxvXSovktlEbLRhnU6CJM9VRjDQJvdrrxevKqHnYRhR
	 5DdAbgX2LFlgw==
Subject: Re: [PATCH net v6 2/3] net: openvswitch: do not record user features
 when the change fails
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, dev@openvswitch.org, aconole@redhat.com,
 echaudro@redhat.com, i.maximets@ovn.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 matttbe@kernel.org, shuah@kernel.org, netdev-bot+sashiko@kernel.org
Date: Wed, 25 Nov 2026 14:53:03 +0000
Message-ID: <179561838354.3135.13483363996689314212@kernel.org>
In-Reply-To: <20261124145033.627044-3-houminxi@gmail.com>
References: <20261124145033.627044-3-houminxi@gmail.com>
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

- [Low] Part of the commit message is wrong.
- [Low] The comment on the new ovs_dp_set_user_features() says the field
  is written with a single WRITE_ONCE() so that "a reader on the receive…

--

net: openvswitch: do not record user features when the change fails

This patch moves the store to dp->user_features in ovs_dp_change() so it
happens after the per-cpu upcall port ID update. A failed request then no
longer leaves the TC_RECIRC_SHARING bit out of step with the tc skb
extension reference. A new helper, ovs_dp_set_user_features(), keeps the
bit and the reference in step. It is used from the reset path, the
ovs_dp_cmd_new() error path and __dp_destroy().

Link: https://lore.kernel.org/netdev/998d522f-e61d-420f-9834-6bdcbaab1361@kernel.org/

> Two of those places leaked a reference: a datapath that fails after
> ovs_dp_change() enabled the key was freed without a disable, and
> ovs_dp_reset_user_features() cleared the bit without one. The reset runs
> when an outdated user space instance sends OVS_DP_CMD_NEW for a name that
> already exists, and after it the datapath's packets no longer share the tc
> skb extension.

[Severity: Low]
Is the last sentence accurate? No packet path in net/openvswitch reads the
per-datapath OVS_DP_F_TC_RECIRC_SHARING bit. ovs_flow_key_extract() checks
only the global static key:

net/openvswitch/flow.c:ovs_flow_key_extract() {
    ...
#if IS_ENABLED(CONFIG_NET_TC_SKB_EXT)
	if (tc_skb_ext_tc_enabled()) {
		tc_ext = skb_ext_find(skb, TC_SKB_EXT);
    ...
}

In net/sched/cls_api.c, tc_skb_ext_tc_enable() and tc_skb_ext_tc_disable()
increment and decrement the single global tc_skb_ext_tc key. cls_flower and
every other OVS datapath hold references to the same key.

Clearing the bit in ovs_dp_reset_user_features() drops this datapath's
reference, which used to leak. The datapath's packets still use the tc skb
extension as long as any other holder keeps the key enabled.

Could the commit message describe this as a reference counting fix rather
than a change in how this datapath handles packets?

> diff --git a/net/openvswitch/datapath.c b/net/openvswitch/datapath.c
> index 96baa2488c266..74e78a954b705 100644
> --- a/net/openvswitch/datapath.c
> +++ b/net/openvswitch/datapath.c
> @@ -1712,6 +1712,36 @@ static struct datapath *lookup_datapath(struct net *net,
>  	return dp ? dp : ERR_PTR(-ENODEV);
>  }
>  
> +/* Called with ovs_mutex, which every writer holds. The field is a single
> + * WRITE_ONCE() so a reader on the receive path, which takes no lock, never
> + * sees a value stitched together from two stores; this helper reads it with
> + * READ_ONCE() for the same reason. The store happens before the reference is
> + * taken or dropped, the order ovs_dp_change() used.
> + */
> +static void ovs_dp_set_user_features(struct datapath *dp, u32 features)
> +{
> +	u32 previous = READ_ONCE(dp->user_features);
> +	bool was = previous & OVS_DP_F_TC_RECIRC_SHARING;
> +	bool now = features & OVS_DP_F_TC_RECIRC_SHARING;
> +
> +	WRITE_ONCE(dp->user_features, features);

[Severity: Low]
This comment says the lockless readers are covered by this WRITE_ONCE(). Is
that true for most of them?

queue_userspace_packet() uses READ_ONCE(), which came from the earlier
series patch "net: openvswitch: read the datapath features once when
sending an upcall". These lockless readers still use plain loads:

net/openvswitch/datapath.c:ovs_dp_process_packet() {
    ...
		else if (dp->user_features & OVS_DP_F_DISPATCH_UPCALL_PER_CPU)
    ...
}

net/openvswitch/actions.c:output_userspace() {
    ...
			else if (dp->user_features &
				 OVS_DP_F_DISPATCH_UPCALL_PER_CPU)
    ...
}

net/openvswitch/vport.c:ovs_vport_get_upcall_portids() {
    ...
	if (vport->dp->user_features & OVS_DP_F_VPORT_PIDS)
    ...
}

The last one is reached from ovs_vport_cmd_get() and ovs_vport_cmd_dump(),
which hold only rcu_read_lock().

Under the kernel memory model, a WRITE_ONCE() that races with a plain load
is still a data race, so KCSAN could report these readers.

The patch also adds a store on a live datapath. __dp_destroy() used to
only read the field. It now writes dp->user_features through
ovs_dp_clear_recirc_sharing() while the datapath is still on the list and
its ports are still attached.

Each of these readers loads an aligned u32 once and tests one bit, so no
functional failure is expected.

Should the remaining lockless readers switch to READ_ONCE()? Otherwise,
could this comment and the @user_features kernel-doc in struct datapath be
narrowed to match what is actually marked?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124145033.627044-1-houminxi%40gmail.com
