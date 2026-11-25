Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618387;
	b=1slKuf3xzvMtvnum3AUaagH9lae9s/Js6JGkWI7pIa+4HviS9DaqgGu5Jnjf5gF0liNa
	 MRROLShKKmeak5ZRaEsVh/6UMlbErWYj/tlF5SoXTqhkGUHYtjjObBoRon/tIcovHeDRQ
	 uZUt8KYOKh2SlEyIF731wypkbOEhxDHAROYNGI3yy9z7oASDFI1dAzSw7i3RLYW6RSvME
	 Jymu7nQn4uYcmAB7uglA3lf/uW8XI9aJXNAhXcIGoXuwOhynrFW+cDWwp8mE7nJSIfhEW
	 A3d5rTwxhxdoTUpTCqSDNsqy72C/5LRGK/svS999TK2UUn4I/CRNKOyslcyh08o4VBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618387;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Znx8OK8MuKncYyxnlDBlz/nz1rG90rVjrlETvLNui/U=;
	b=supPWK9u0DmbOzkeRYQlmbbcvzGBOsfzVd6WDTTP2gFoT2rk6ruMS4L7mHkqF6f/mAru
	 PlRVfHGZh7HxnH8pDdYeCNAMzeRvDLN8oQJQOLWezDE5MjmQOC0FBCjrQkrFi5ldMuTut
	 RXpNTOu7tajCBbqY68HuShpyaGTDZdPaVujBajBOY7ncAI5WasnCVbdiIVJ7/v+2qfNqm
	 1x8f9aMmxam60CkfzAwOb1pn2NmG4HRHvOLafOZdNOd4vzbMVOMe3SzOzvthTpiZOspUC
	 dCgJ6S3nne0ru7tPy8Oo3eKr33ZMrO8Df5NXrHAI7ff5ZVysjfWVFGmtkGY5eD62TRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="mGNNI/9A";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D2606A33C
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mGNNI/9A
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3D7A1F000E0;
	Wed, 25 Nov 2026 14:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795618386;
	bh=Znx8OK8MuKncYyxnlDBlz/nz1rG90rVjrlETvLNui/U=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=mGNNI/9AfiHWn7a/r5ARO+lECJpVin/AEdPf18O0HgzrBxfc1tMdqGxxGa2IIurw6
	 57ZqIuEP2NlJ5FdUk4uBzBcl+DJSOpxu8eE+p2cqvGllhGdC06nBr3bHPRluQih3sJ
	 1QFg2cYDcDuwjHE9OVQaATRtLBvE3fyqv/EVhfvY+WNJQgqNZZ2D8PXUxnWc1awx/d
	 zfUryJYu7qDWXRDc5phGGgj9lVcOAujlNJtqs3cpxCdwx1Q/Zkdq1VvbzZnaB8XK8u
	 9UgEplhUQtNYaHkTta/NKIBTsFIYHfbccoyDl06WwgwHiNMAHg7Nxs/14gKrwhGi0E
	 05l+hA3By1p7w==
Subject: Re: [PATCH net v6 3/3] selftests/net/openvswitch: check that a failed
 set keeps the features
From: netdev-bot+sashiko@kernel.org
To: houminxi@gmail.com
Cc: netdev@vger.kernel.org, dev@openvswitch.org, aconole@redhat.com,
 echaudro@redhat.com, i.maximets@ovn.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
 matttbe@kernel.org, shuah@kernel.org, netdev-bot+sashiko@kernel.org
Date: Wed, 25 Nov 2026 14:53:05 +0000
Message-ID: <179561838528.3135.298909861336575885@kernel.org>
In-Reply-To: <20261124145033.627044-4-houminxi@gmail.com>
References: <20261124145033.627044-4-houminxi@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In tools/testing/selftests/net/openvswitch/openvswitch.sh,
  both new tests guard datapath creation with `ovs_add_dp "$t" "$dp" ||…

--

selftests/net/openvswitch: check that a failed set keeps the features

This adds a set-dp command to ovs-dpctl.py and two openvswitch selftests
that use it. The tests check that a set with an empty per-cpu-pids is
rejected with EINVAL and leaves the datapath features unchanged, and that
an outdated OVS_DP_CMD_NEW request drops the features. The config fragment
also gains NET_SCHED, NET_CLS_ACT and NET_TC_SKB_EXT for the recirc bit.

> diff --git a/tools/testing/selftests/net/openvswitch/openvswitch.sh b/tools/testing/selftests/net/openvswitch/openvswitch.sh
> index 21444657a0404..cdeca5a63671f 100755
> --- a/tools/testing/selftests/net/openvswitch/openvswitch.sh
> +++ b/tools/testing/selftests/net/openvswitch/openvswitch.sh

[ ... ]

> +test_dp_features() {
> +	local t="test_dp_features"
> +	local dp="dpfeat0"
> +
> +	sbx_add "$t" || return $?
> +	ovs_add_dp "$t" "$dp" || return 1

[Severity: Medium]
Can this "|| return 1" ever trigger when add-dp fails?

ovs_add_dp() runs add-dp and then calls on_exit():

ovs_add_dp () {
	...
	ovs_sbx "$sbxname" python3 $ovs_base/ovs-dpctl.py add-dp $*
	on_exit "ovs_sbx $sbxname python3 $ovs_base/ovs-dpctl.py del-dp $1;"
}

on_exit() {
	echo "$1" > ${ovs_dir}/cleanup.tmp
	cat ${ovs_dir}/cleanup >> ${ovs_dir}/cleanup.tmp
	mv ${ovs_dir}/cleanup.tmp ${ovs_dir}/cleanup
}

The function returns the status of the final mv, so the exit status of
add-dp is lost. OvsDatapath.create() swallows only EEXIST and re-raises
any other NetlinkError, so add-dp can exit non-zero.

If that happens, the first failure the test sees is the next step:

> +
> +	info "clear the datapath features"
> +	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
> +	    { ovs_fail "the datapath features could not be cleared"; return 1; }

Here set-dp prints "DP 'dpfeat0' not found." to stdout. ovs_sbx sends that
into debug.log, and run_test removes $ovs_dir on FAIL. The only reason left
on stderr is "the datapath features could not be cleared", while the real
cause was that the datapath was never created.

The commit message says:

    Every step that can fail says why it did.

The datapath creation step doesn't seem to meet that. Could add-dp's
status be checked, either with "|| return 1" on the add-dp line in
ovs_add_dp() before on_exit, or by calling add-dp directly in the new tests
with an ovs_fail message?

The ovs_add_dp() behaviour is older than this patch, but the new tests
depend on a return status that the helper never gives.

[ ... ]

> +test_dp_features_recirc() {
> +	local t="test_dp_features_recirc"
> +	local dp="dpfeat1"
> +
> +	sbx_add "$t" || return $?
> +	ovs_add_dp "$t" "$dp" || return 1
> +
> +	ovs_sbx "$t" ovs_dp_features_set "$dp" --features 0 ||
> +	    { ovs_fail "the datapath features could not be cleared"; return 1; }

The same applies here. A failed add-dp for dpfeat1 would be reported as
"the datapath features could not be cleared".

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124145033.627044-1-houminxi%40gmail.com
